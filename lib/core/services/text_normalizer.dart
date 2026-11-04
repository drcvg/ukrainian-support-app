
class TextNormalizer {
  /// Corrige errores ortográficos conocidos y seguros
  /// sin modificar el resto del texto.
  static String normalize(String text) {
    var result = text;

    // Correcciones explícitas y conservadoras.
    const corrections = <String, String>{
      'me cai': 'me caí',
      'Me cai': 'Me caí',
      'ME CAI': 'ME CAÍ',
      'medico': 'médico',
      'Medico': 'Médico',
      'MEDICO': 'MÉDICO',
    };

    for (final correction in corrections.entries) {
      result = result.replaceAll(
        RegExp(
          '\\b${RegExp.escape(correction.key)}\\b',
          caseSensitive: true,
        ),
        correction.value,
      );
    }

    return result;
  }
}
