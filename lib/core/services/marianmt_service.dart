
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_sentencepiece_tokenizer/dart_sentencepiece_tokenizer.dart';
import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';

import 'model_files_service.dart';

class MarianMTService {
  static const int _eosTokenId = 0;
  static const int _maxOutputTokens = 64;

  final OnnxRuntime _runtime = OnnxRuntime();

  OrtSession? _encoder;
  OrtSession? _decoder;

  SentencePieceTokenizer? _sourceTokenizer;
  SentencePieceTokenizer? _targetTokenizer;

  Map<String, int> _vocabulary = {};
  Map<int, String> _inverseVocabulary = {};

  String? _loadedDirection;
  int _startTokenId = 0;
  int _vocabularySize = 0;
  bool _busy = false;
  bool _closed = false;

  Future<String> translate(
    String text, {
    required bool spanishToUkrainian,
  }) async {
    if (_closed) {
      throw StateError('El servicio de traducción está cerrado.');
    }

    if (_busy) {
      throw StateError(
        'Ya hay una traducción en curso. Inténtalo de nuevo.',
      );
    }

    final input = text.trim();

    if (input.isEmpty) {
      throw ArgumentError('Introduce un texto para traducir.');
    }

    _busy = true;

    try {
      final direction = spanishToUkrainian ? 'es_uk' : 'uk_es';

      await _loadDirection(direction);

      final sourceTokenizer = _sourceTokenizer!;
      final targetTokenizer = _targetTokenizer!;

      final pieces = sourceTokenizer
          .encode(input, addSpecialTokens: false)
          .tokens;

      if (pieces.isEmpty) {
        throw StateError('No se han podido tokenizar las palabras.');
      }

      if (pieces.length > 511) {
        throw ArgumentError(
          'El texto es demasiado largo. '
          'Reduce la entrada a un máximo de 511 piezas de texto.',
        );
      }

      final sourceIds = <int>[];

      for (final piece in pieces) {
        final id = _vocabulary[piece];

        if (id == null) {
          throw StateError(
            'No se encontró la pieza "$piece" en el vocabulario.',
          );
        }

        sourceIds.add(id);
      }

      sourceIds.add(_eosTokenId);

      final sourceLength = sourceIds.length;

      final encoderIds = await OrtValue.fromList(
        Int64List.fromList(sourceIds),
        [1, sourceLength],
      );

      final encoderMask = await OrtValue.fromList(
        Int64List.fromList(List<int>.filled(sourceLength, 1)),
        [1, sourceLength],
      );

      try {
        final encoderOutputs = await _encoder!.run({
          'input_ids': encoderIds,
          'attention_mask': encoderMask,
        });

        try {
          final hiddenStatesValue = encoderOutputs['last_hidden_state'];

          if (hiddenStatesValue == null) {
            throw StateError(
              'El encoder no devolvió last_hidden_state.',
            );
          }

          final hiddenValues = await hiddenStatesValue.asFlattenedList();

          final hiddenStates = Float32List.fromList(
            hiddenValues.map((value) => (value as num).toDouble()).toList(),
          );

          return await _generateTranslation(
            sourceLength: sourceLength,
            hiddenStates: hiddenStates,
            targetTokenizer: targetTokenizer,
          );
        } finally {
          for (final output in encoderOutputs.values) {
            await output.dispose();
          }
        }
      } finally {
        await encoderIds.dispose();
        await encoderMask.dispose();
      }
    } finally {
      _busy = false;
    }
  }

  Future<String> _generateTranslation({
    required int sourceLength,
    required Float32List hiddenStates,
    required SentencePieceTokenizer targetTokenizer,
  }) async {
    final generatedIds = <int>[_startTokenId];

    final encoderMask = await OrtValue.fromList(
      Int64List.fromList(List<int>.filled(sourceLength, 1)),
      [1, sourceLength],
    );

    final encoderHiddenStates = await OrtValue.fromList(
      hiddenStates,
      [1, sourceLength, 512],
    );

    try {
      for (var step = 0; step < _maxOutputTokens; step++) {
        final decoderIds = await OrtValue.fromList(
          Int64List.fromList(generatedIds),
          [1, generatedIds.length],
        );

        try {
          final outputs = await _decoder!.run({
            'encoder_attention_mask': encoderMask,
            'input_ids': decoderIds,
            'encoder_hidden_states': encoderHiddenStates,
          });

          try {
            final logitsValue = outputs['logits'];

            if (logitsValue == null) {
              throw StateError('El decoder no devolvió logits.');
            }

            final logits = await logitsValue.asFlattenedList();

            final lastPositionOffset =
                (generatedIds.length - 1) * _vocabularySize;

            if (logits.length < lastPositionOffset + _vocabularySize) {
              throw StateError(
                'El decoder devolvió una salida de tamaño inesperado.',
              );
            }

            var bestId = -1;
            var bestScore = double.negativeInfinity;

            for (var id = 0; id < _vocabularySize; id++) {
              if (id == _startTokenId) {
                continue;
              }

              final score =
                  (logits[lastPositionOffset + id] as num).toDouble();

              if (score > bestScore) {
                bestScore = score;
                bestId = id;
              }
            }

            if (bestId == _eosTokenId) {
              break;
            }

            if (bestId < 0) {
              throw StateError(
                'No se pudo seleccionar el siguiente token.',
              );
            }

            generatedIds.add(bestId);
          } finally {
            for (final output in outputs.values) {
              await output.dispose();
            }
          }
        } finally {
          await decoderIds.dispose();
        }
      }
    } finally {
      await encoderMask.dispose();
      await encoderHiddenStates.dispose();
    }

    final pieces = <String>[];

    for (final id in generatedIds.skip(1)) {
      if (id == _eosTokenId || id == _startTokenId) {
        continue;
      }

      final piece = _inverseVocabulary[id];

      if (piece != null) {
        pieces.add(piece);
      }
    }

    final sentencePieceIds = targetTokenizer.convertTokensToIds(pieces);

    return targetTokenizer
        .decode(sentencePieceIds, skipSpecialTokens: true)
        .trim();
  }

  Future<void> _loadDirection(String direction) async {
    if (_loadedDirection == direction &&
        _encoder != null &&
        _decoder != null) {
      return;
    }

    await _releaseSessions();

    final directories = await ModelFilesService.prepareModels();
    final directory = directories[direction];

    if (directory == null) {
      throw StateError(
        'No se encontró la ruta del modelo $direction.',
      );
    }

    final config = direction == 'es_uk'
        ? (startId: 62459, vocabSize: 62460)
        : (startId: 61937, vocabSize: 61938);

    _startTokenId = config.startId;
    _vocabularySize = config.vocabSize;

    final vocabularyFile = File('$directory/vocab.json');
    final vocabularyJson =
        jsonDecode(await vocabularyFile.readAsString())
            as Map<String, dynamic>;

    _vocabulary = vocabularyJson.map(
      (piece, id) => MapEntry(piece, (id as num).toInt()),
    );

    _inverseVocabulary = {
      for (final entry in _vocabulary.entries) entry.value: entry.key,
    };

    _sourceTokenizer = SentencePieceTokenizer.fromModelFileSync(
      '$directory/source.spm',
    );

    _targetTokenizer = SentencePieceTokenizer.fromModelFileSync(
      '$directory/target.spm',
    );

    try {
      _encoder = await _runtime.createSession(
        '$directory/encoder_model.onnx',
      );

      _decoder = await _runtime.createSession(
        '$directory/decoder_model.onnx',
      );

      _loadedDirection = direction;
    } catch (_) {
      await _releaseSessions();
      rethrow;
    }
  }

  Future<void> _releaseSessions() async {
    final decoder = _decoder;
    final encoder = _encoder;

    _decoder = null;
    _encoder = null;
    _loadedDirection = null;

    if (decoder != null) {
      await decoder.close();
    }

    if (encoder != null) {
      await encoder.close();
    }

    _sourceTokenizer = null;
    _targetTokenizer = null;
    _vocabulary = {};
    _inverseVocabulary = {};
  }

  Future<void> dispose() async {
    if (_closed) {
      return;
    }

    if (_busy) {
      throw StateError(
        'Espera a que termine la traducción antes de cerrar el servicio.',
      );
    }

    await _releaseSessions();
    _closed = true;
  }
}
