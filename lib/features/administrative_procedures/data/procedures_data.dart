
import '../models/procedure_model.dart';

const List<Procedure> procedures = [
  Procedure(
    id: 'proteccion-temporal',
    category: 'Extranjería y situación legal',
    title: 'Solicitar protección temporal',
    description:
        'Información sobre la solicitud de protección temporal en España '
        'para personas desplazadas de Ucrania.',
    requirements: [
      'Acreditar la identidad.',
      'Demostrar que se encuentra dentro de los supuestos de protección.',
      'Seguir las indicaciones de las autoridades competentes.',
    ],
    documents: [
      'Pasaporte ucraniano o documento de identidad.',
      'Documentación que acredite la situación personal y familiar, si corresponde.',
      'Documentación adicional que soliciten las autoridades.',
    ],
    steps: [
      'Consultar si se cumplen las condiciones para obtener protección temporal.',
      'Preparar la documentación disponible.',
      'Acudir al centro habilitado para presentar la solicitud.',
      'Entregar la documentación y recibir el justificante correspondiente.',
      'Consultar la resolución de la solicitud.',
    ],
    officialUrl: 'https://proteccion-asilo.interior.gob.es/',
  ),
  Procedure(
    id: 'renovar-proteccion-temporal',
    category: 'Extranjería y situación legal',
    title: 'Renovar o actualizar la protección temporal',
    description:
        'Información para consultar la vigencia de la protección temporal '
        'y las medidas de prórroga o actualización aplicables.',
    requirements: [
      'Comprobar la vigencia de la autorización.',
      'Consultar si existe algún trámite de actualización aplicable.',
    ],
    documents: [
      'Documento de identidad.',
      'Documentación de protección temporal.',
    ],
    steps: [
      'Comprobar la fecha de vigencia de la autorización.',
      'Consultar las instrucciones oficiales vigentes.',
      'Realizar las gestiones que correspondan según el caso.',
    ],
    officialUrl: 'https://proteccion-asilo.interior.gob.es/',
  ),
  Procedure(
    id: 'solicitar-tie',
    category: 'Extranjería y situación legal',
    title: 'Solicitar la tarjeta TIE',
    description:
        'Información para obtener la Tarjeta de Identidad de Extranjero '
        'cuando corresponda.',
    requirements: [
      'Disponer de una autorización o resolución que permita solicitar la TIE.',
      'Consultar el procedimiento de expedición de la tarjeta.',
    ],
    documents: [
      'Pasaporte o documento de identidad.',
      'Resolución o documentación que acredite la autorización.',
      'Formulario y justificante de pago de la tasa, cuando corresponda.',
      'Fotografía reciente, según los requisitos aplicables.',
    ],
    steps: [
      'Consultar el procedimiento y los requisitos.',
      'Solicitar cita previa para el trámite correspondiente.',
      'Preparar la documentación.',
      'Acudir a la cita para realizar las gestiones necesarias.',
      'Consultar cuándo se puede recoger la tarjeta.',
    ],
    officialUrl: 'https://sede.policia.gob.es/',
  ),
  Procedure(
    id: 'obtener-nie',
    category: 'Extranjería y situación legal',
    title: 'Obtener o consultar el NIE',
    description:
        'Información sobre el Número de Identidad de Extranjero y '
        'cómo consultar su asignación.',
    requirements: [
      'Encontrarse en un supuesto que permita solicitar la asignación del NIE.',
      'Justificar el motivo de la solicitud cuando sea necesario.',
    ],
    documents: [
      'Pasaporte o documento de identidad.',
      'Formulario oficial correspondiente.',
      'Documentación que justifique la solicitud, cuando proceda.',
    ],
    steps: [
      'Consultar si ya se dispone de un NIE.',
      'Identificar el procedimiento correspondiente.',
      'Preparar la documentación.',
      'Presentar la solicitud ante el organismo competente.',
    ],
    officialUrl: 'https://sede.policia.gob.es/',
  ),
  Procedure(
    id: 'cita-extranjeria',
    category: 'Extranjería y situación legal',
    title: 'Solicitar cita previa en Extranjería',
    description:
        'Información para solicitar una cita relacionada con procedimientos '
        'de extranjería.',
    requirements: [
      'Identificar el trámite que se desea realizar.',
      'Comprobar la disponibilidad del servicio en la provincia correspondiente.',
    ],
    documents: [
      'Documento de identidad.',
      'NIE, si se dispone de él.',
      'Datos personales necesarios para solicitar la cita.',
    ],
    steps: [
      'Acceder al portal oficial de cita previa.',
      'Seleccionar la provincia.',
      'Elegir el trámite correspondiente.',
      'Seguir las instrucciones para confirmar la cita.',
      'Guardar el justificante de la cita.',
    ],
    officialUrl: 'https://sede.administracionespublicas.gob.es/',
  ),
  Procedure(
    id: 'consultar-expediente',
    category: 'Extranjería y situación legal',
    title: 'Consultar el estado de un expediente',
    description:
        'Información para comprobar el estado de tramitación de una '
        'solicitud administrativa de extranjería.',
    requirements: [
      'Haber presentado una solicitud.',
      'Disponer de los datos identificativos del expediente.',
    ],
    documents: [
      'NIE o número de identificación correspondiente.',
      'Número de expediente, cuando esté disponible.',
    ],
    steps: [
      'Acceder al servicio oficial de consulta.',
      'Introducir los datos solicitados.',
      'Consultar el estado de tramitación.',
      'Seguir las indicaciones si se requiere documentación adicional.',
    ],
    officialUrl: 'https://sede.administracionespublicas.gob.es/',
  ),
  Procedure(
    id: 'cambio-domicilio',
    category: 'Extranjería y situación legal',
    title: 'Comunicar un cambio de domicilio',
    description:
        'Información sobre cómo comunicar un cambio de domicilio a los '
        'organismos administrativos cuando sea necesario.',
    requirements: [
      'Disponer de un nuevo domicilio.',
      'Comprobar qué organismos deben recibir la comunicación.',
    ],
    documents: [
      'Documento de identidad.',
      'Justificante del nuevo domicilio, cuando corresponda.',
      'Documentación del expediente, si resulta necesaria.',
    ],
    steps: [
      'Identificar los organismos ante los que debe comunicarse el cambio.',
      'Consultar los medios de comunicación disponibles.',
      'Presentar los datos y documentos requeridos.',
      'Conservar el justificante de la comunicación.',
    ],
    officialUrl: 'https://administracion.gob.es/',
  ),
  Procedure(
    id: 'certificados-administrativos',
    category: 'Extranjería y situación legal',
    title: 'Solicitar certificados administrativos',
    description:
        'Orientación para obtener certificados relacionados con la '
        'situación administrativa y de residencia.',
    requirements: [
      'Identificar el certificado que se necesita.',
      'Comprobar qué organismo es competente para expedirlo.',
    ],
    documents: [
      'Documento de identidad.',
      'Datos personales necesarios para la solicitud.',
      'Documentación adicional según el certificado.',
    ],
    steps: [
      'Identificar el certificado necesario.',
      'Localizar el organismo responsable.',
      'Consultar los requisitos y las tasas, si existen.',
      'Presentar la solicitud.',
      'Obtener o descargar el certificado.',
    ],
    officialUrl: 'https://administracion.gob.es/',
  ),
  Procedure(
    id: 'autorizaciones-residencia',
    category: 'Extranjería y situación legal',
    title: 'Consultar procedimientos de residencia',
    description:
        'Información general sobre las diferentes autorizaciones y '
        'procedimientos de residencia en España.',
    requirements: [
      'Identificar la situación administrativa personal.',
      'Comprobar los requisitos de la autorización correspondiente.',
    ],
    documents: [
      'Pasaporte o documento de identidad.',
      'Documentación que acredite la situación personal.',
      'Documentos específicos según el procedimiento.',
    ],
    steps: [
      'Identificar el procedimiento aplicable.',
      'Consultar la normativa y los requisitos vigentes.',
      'Preparar la documentación.',
      'Presentar la solicitud ante el organismo competente.',
      'Consultar el estado del expediente.',
    ],
    officialUrl: 'https://www.inclusion.gob.es/',
  ),
  Procedure(
    id: 'reagrupacion-familiar',
    category: 'Extranjería y situación legal',
    title: 'Reagrupación familiar',
    description:
        'Información general sobre los procedimientos de reagrupación '
        'familiar y sus condiciones.',
    requirements: [
      'Comprobar si la situación personal permite solicitar la reagrupación.',
      'Consultar las condiciones aplicables a los familiares.',
    ],
    documents: [
      'Documentos de identidad de las personas implicadas.',
      'Documentación que acredite los vínculos familiares.',
      'Documentación adicional según el procedimiento.',
    ],
    steps: [
      'Consultar el procedimiento aplicable a la situación familiar.',
      'Reunir los documentos que acrediten los vínculos familiares.',
      'Comprobar los requisitos específicos.',
      'Presentar la solicitud ante el organismo competente.',
      'Seguir las instrucciones de resolución.',
    ],
    officialUrl: 'https://www.inclusion.gob.es/',
  ),
];
