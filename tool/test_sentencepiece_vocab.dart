import 'dart:convert';
import 'dart:io';

import 'package:dart_sentencepiece_tokenizer/dart_sentencepiece_tokenizer.dart';

void main() {
  const carpeta =
      r'C:\Users\vdarc\marianmt-models\es-uk-onnx-int8';

  final tokenizer = SentencePieceTokenizer.fromModelFileSync(
    '$carpeta\\source.spm',
  );

  final vocabulario = jsonDecode(
    File('$carpeta\\vocab.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  const frases = [
    'Hola, necesito ayuda para encontrar un médico.',
    '¿Dónde está la farmacia?',
    'No hablo ucraniano.',
    'Necesito agua y comida.',
    'Mi cita es a las 10:30.',
  ];

  var totalErrores = 0;

  for (final texto in frases) {
    final resultado = tokenizer.encode(
      texto,
      addSpecialTokens: false,
    );

    final ids = <int>[];
    final piezasFaltantes = <String>[];

    for (final pieza in resultado.tokens) {
      final id = vocabulario[pieza];

      if (id is int) {
        ids.add(id);
      } else {
        piezasFaltantes.add(pieza);
      }
    }

    print('\nTEXTO: $texto');
    print('PIEZAS: ${resultado.tokens}');

    if (piezasFaltantes.isEmpty) {
      ids.add(0);
      print('IDS MARIANMT: $ids');
      print('ESTADO: CORRECTO');
    } else {
      totalErrores += piezasFaltantes.length;
      print('PIEZAS NO ENCONTRADAS: $piezasFaltantes');
      print('ESTADO: REVISAR');
    }
  }

  print('\nERRORES DE VOCABULARIO: $totalErrores');
}
