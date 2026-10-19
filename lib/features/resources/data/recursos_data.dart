
class Recurso {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcion;
  final String urlOficial;

  const Recurso({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcion,
    required this.urlOficial,
  });
}

const List<Recurso> recursos = [
  Recurso(
    id: 'cruz-roja',
    nombre: 'Cruz Roja España',
    categoria: 'Ayuda humanitaria',
    descripcion:
        'Información sobre programas de apoyo y atención '
        'a personas en situación de vulnerabilidad.',
    urlOficial: 'https://www.cruzroja.es/',
  ),
  Recurso(
    id: 'acnur',
    nombre: 'ACNUR España',
    categoria: 'Protección internacional',
    descripcion:
        'Orientación e información para personas refugiadas '
        'y solicitantes de protección internacional.',
    urlOficial: 'https://www.acnur.org/es-es/',
  ),
  Recurso(
    id: 'caritas',
    nombre: 'Cáritas España',
    categoria: 'Apoyo social',
    descripcion:
        'Información sobre acogida, acompañamiento y '
        'programas de apoyo social.',
    urlOficial: 'https://www.caritas.es/',
  ),
  Recurso(
    id: 'cear',
    nombre: 'CEAR',
    categoria: 'Asesoramiento',
    descripcion:
        'Información y orientación para personas refugiadas '
        'y solicitantes de asilo.',
    urlOficial: 'https://www.cear.es/',
  ),
  Recurso(
    id: 'embajada-ucrania',
    nombre: 'Embajada de Ucrania en España',
    categoria: 'Atención consular',
    descripcion:
        'Información consular y contacto institucional '
        'para ciudadanos ucranianos.',
    urlOficial: 'https://spain.mfa.gov.ua/',
  ),
];
