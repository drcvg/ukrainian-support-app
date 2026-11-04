import 'dart:convert';
import 'dart:io';

import 'package:dart_sentencepiece_tokenizer/dart_sentencepiece_tokenizer.dart';

void main() {
  const carpeta =
      r'C:\Users\vdarc\marianmt-models\es-uk-onnx-int8';

  final tokenizer = SentencePieceTokenizer.fromModelFileSync(
    '$carpeta\\target.spm',
  );

  final vocabulario = jsonDecode(
    File('$carpeta\\vocab.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  final vocabularioInverso = <int, String>{};

  for (final entrada in vocabulario.entries) {
    final id = entrada.value;
    if (id is int) {
      vocabularioInverso[id] = entrada.key;
    }
  }

  const textoOriginal = 'Привіт, мені потрібна допомога.';

  print('TEXTO ORIGINAL: $textoOriginal');

  final resultado = tokenizer.encode(
    textoOriginal,
    addSpecialTokens: false,
  );

  print('PIEZAS: ${resultado.tokens}');

  final idsMarian = <int>[];
  var correcto = true;

  for (final pieza in resultado.tokens) {
    final id = vocabulario[pieza];

    if (id is int) {
      idsMarian.add(id);
    } else {
      correcto = false;
      print('PIEZA NO ENCONTRADA: $pieza');
    }
  }

  if (!correcto) {
    print('ERROR: hay piezas fuera del vocabulario.');
    return;
  }

  print('IDS MARIANMT: $idsMarian');

  final piezasRecuperadas = <String>[];

  for (final id in idsMarian) {
    final pieza = vocabularioInverso[id];

    if (pieza == null) {
      print('ID NO ENCONTRADO: $id');
      return;
    }

    piezasRecuperadas.add(pieza);
  }

  print('PIEZAS RECUPERADAS: $piezasRecuperadas');

  final idsSentencePiece = tokenizer.convertTokensToIds(
    piezasRecuperadas,
  );

  print('IDS INTERNOS SENTENCEPIECE: $idsSentencePiece');

  final textoReconstruido = tokenizer.decode(idsSentencePiece);

  print('TEXTO RECONSTRUIDO: $textoReconstruido');
  print('PRUEBA COMPLETADA');
}
