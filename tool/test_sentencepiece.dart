import 'package:dart_sentencepiece_tokenizer/dart_sentencepiece_tokenizer.dart';

void main() {
  const ruta =
      r'C:\Users\vdarc\marianmt-models\es-uk-onnx-int8\source.spm';

  print('1. Cargando SentencePiece...');
  final tokenizer = SentencePieceTokenizer.fromModelFileSync(ruta);

  const texto = 'Hola, necesito ayuda para encontrar un médico.';

  print('2. Tokenizando texto...');
  final resultado = tokenizer.encode(
    texto,
    addSpecialTokens: false,
  );

  print('Texto: $texto');
  print('Tokens: ${resultado.tokens}');
  print('IDs: ${resultado.ids}');
  print('Cantidad de tokens: ${resultado.ids.length}');
  print('PRUEBA COMPLETADA');
}
