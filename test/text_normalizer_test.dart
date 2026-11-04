
import 'package:flutter_test/flutter_test.dart';
import 'package:ukranian_support/core/services/text_normalizer.dart';

void main() {
  group('TextNormalizer', () {
    test('Corrige Me cai', () {
      expect(
        TextNormalizer.normalize('Me cai.'),
        'Me caí.',
      );
    });

    test('Corrige medico', () {
      expect(
        TextNormalizer.normalize('necesito un medico'),
        'necesito un médico',
      );
    });

    test('Mantiene las palabras correctas', () {
      expect(
        TextNormalizer.normalize('Me caí, necesito un médico.'),
        'Me caí, necesito un médico.',
      );
    });
  });
}
