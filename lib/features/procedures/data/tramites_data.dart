
class Tramite {
  final String id;
  final String titulo;
  final String descripcion;
  final List<String> requisitos;
  final List<String> documentos;
  final String urlOficial;

  const Tramite({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.requisitos,
    required this.documentos,
    required this.urlOficial,
  });
}

const List<Tramite> tramites = [
  Tramite(
    id: 'proteccion-temporal',
    titulo: 'Protección Temporal',
    descripcion:
        'Información sobre la protección temporal para personas '
        'desplazadas de Ucrania en España.',
    requisitos: [
      'Acreditar la identidad.',
      'Aportar la documentación disponible sobre la situación personal.',
      'Seguir las indicaciones de las autoridades competentes.',
    ],
    documentos: [
      'Pasaporte o documento de identidad, si se dispone de él.',
      'Documentación adicional solicitada por las autoridades.',
    ],
    urlOficial: 'https://proteccion-asilo.interior.gob.es/',
  ),
  Tramite(
    id: 'tarjeta-sanitaria',
    titulo: 'Tarjeta Sanitaria',
    descripcion:
        'Orientación para acceder a la asistencia sanitaria '
        'en España.',
    requisitos: [
      'Consultar las condiciones de acceso según la situación personal.',
      'Contactar con el servicio sanitario de la comunidad autónoma.',
    ],
    documentos: [
      'Documento de identidad, si se dispone de él.',
      'Documentación de residencia o empadronamiento, '
          'si corresponde.',
    ],
    urlOficial: 'https://www.sanidad.gob.es/',
  ),
  Tramite(
    id: 'empadronamiento',
    titulo: 'Empadronamiento',
    descripcion:
        'Información para inscribirse en el padrón municipal '
        'del lugar de residencia.',
    requisitos: [
      'Consultar el procedimiento del ayuntamiento correspondiente.',
      'Acreditar la identidad y el domicilio según las normas locales.',
    ],
    documentos: [
      'Documento de identidad, si se dispone de él.',
      'Justificante de domicilio aceptado por el ayuntamiento.',
    ],
    urlOficial: 'https://administracion.gob.es/',
  ),
  Tramite(
    id: 'prestacion-economica',
    titulo: 'Prestación Económica',
    descripcion:
        'Orientación para consultar las ayudas económicas '
        'disponibles según las circunstancias personales.',
    requisitos: [
      'Consultar los requisitos de cada ayuda.',
      'Comprobar los plazos y las condiciones de solicitud.',
    ],
    documentos: [
      'Documentación de identidad, si se dispone de ella.',
      'Justificantes específicos que solicite el organismo responsable.',
    ],
    urlOficial: 'https://www.inclusion.gob.es/',
  ),
];
