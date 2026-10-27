
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class ModelFilesService {
  ModelFilesService._();

  static const String _baseUrl =
      'https://huggingface.co/devegda/ukrainian-support-models'
      '/resolve/main/marianmt_models';

  static const Map<String, Map<String, _ModelFile>> _files = {
    'es_uk': {
      'config.json': _ModelFile(1367),
      'decoder_model.onnx': _ModelFile(
        186953244,
        sha256:
            'dc1b40475e626b0f7da6ddd3715886dc69be17528ab5c1e78d629ad4f00dbff1',
      ),
      'encoder_model.onnx': _ModelFile(
        148144768,
        sha256:
            '1cdfe2d02c03623c1c64c622fe97fc56fdc82e52adb07c153a5b2e8b8e56ee06',
      ),
      'generation_config.json': _ModelFile(304),
      'source.spm': _ModelFile(840419),
      'special_tokens_map.json': _ModelFile(79),
      'target.spm': _ModelFile(1027691),
      'tokenizer_config.json': _ModelFile(888),
      'vocab.json': _ModelFile(2691028),
    },
    'uk_es': {
      'config.json': _ModelFile(1354),
      'decoder_model.onnx': _ModelFile(
        185614836,
        sha256:
            '05cf27c85e5e35f3fac2f81f7a67885ca1239f8eb71cb5d33a324c671a2b82c9',
      ),
      'encoder_model.onnx': _ModelFile(
        147075712,
        sha256:
            '7279ea769dfe619819a732f8eaa42ea98d46219d322ddb9845d3de6de3c46989',
      ),
      'generation_config.json': _ModelFile(304),
      'special_tokens_map.json': _ModelFile(79),
      'target.spm': _ModelFile(833438),
      'tokenizer_config.json': _ModelFile(886),
      'vocab.json': _ModelFile(2609627),
    },
  };

  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 30),
      followRedirects: true,
    ),
  );

  static bool _downloading = false;

  /// Prepara ambos modelos y devuelve sus rutas locales.
  ///
  /// progress recibe un valor entre 0.0 y 1.0.
  static Future<Map<String, String>> prepareModels({
    ValueChanged<double>? progress,
  }) async {
    if (_downloading) {
      throw StateError('Ya hay una descarga de modelos en curso.');
    }

    _downloading = true;

    try {
      final root = await getApplicationSupportDirectory();
      final modelsRoot = Directory(
        '${root.path}${Platform.pathSeparator}marianmt_models',
      );

      await modelsRoot.create(recursive: true);

      final totalBytes = _files.values
          .expand((files) => files.values)
          .fold<int>(0, (sum, file) => sum + file.size);

      var completedBytes = 0;

      final directories = <String, String>{};

      for (final entry in _files.entries) {
        final direction = entry.key;
        final directory = Directory(
          '${modelsRoot.path}${Platform.pathSeparator}$direction',
        );

        await directory.create(recursive: true);

        for (final fileEntry in entry.value.entries) {
          final name = fileEntry.key;
          final specification = fileEntry.value;

          final destination = File(
            '${directory.path}${Platform.pathSeparator}$name',
          );

          if (await _isValid(destination, specification)) {
            completedBytes += specification.size;
            progress?.call(completedBytes / totalBytes);
            continue;
          }

          if (await destination.exists()) {
            await destination.delete();
          }

          final temporary = File('${destination.path}.download');

          try {
            if (await temporary.exists()) {
              await temporary.delete();
            }

            final url = '$_baseUrl/$direction/$name';

            await _dio.download(
              url,
              temporary.path,
              onReceiveProgress: (received, _) {
                final currentBytes = received < 0
                    ? 0
                    : received.clamp(0, specification.size);

                final overall = completedBytes + currentBytes;

                progress?.call(
                  (overall / totalBytes).clamp(0.0, 1.0),
                );
              },
            );

            if (!await _isValid(temporary, specification)) {
              throw StateError(
                'El archivo descargado no supera la validación: $name',
              );
            }

            await temporary.rename(destination.path);

            completedBytes += specification.size;
            progress?.call(completedBytes / totalBytes);
          } catch (_) {
            if (await temporary.exists()) {
              await temporary.delete();
            }
            rethrow;
          }
        }

        directories[direction] = directory.path;
      }

      progress?.call(1.0);

      return Map<String, String>.unmodifiable(directories);
    } finally {
      _downloading = false;
    }
  }

  static Future<bool> _isValid(
    File file,
    _ModelFile specification,
  ) async {
    if (!await file.exists()) {
      return false;
    }

    if (await file.length() != specification.size) {
      return false;
    }

    final expectedHash = specification.sha256;

    if (expectedHash != null) {
      final actualHash = await sha256.bind(file.openRead()).first;
      return actualHash.toString() == expectedHash;
    }

    return true;
  }
}

class _ModelFile {
  const _ModelFile(this.size, {this.sha256});

  final int size;
  final String? sha256;
}
