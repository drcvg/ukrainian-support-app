import 'package:drift/drift.dart';

import '../app_database.dart';

/// Introduce los datos iniciales del catálogo.
///
/// Es una operación idempotente: si se ejecuta varias veces,
/// actualiza los registros existentes en lugar de duplicarlos.
Future<void> loadInitialData(AppDatabase db) async {
  await db.transaction(() async {
    // 1. CATEGORÍAS
    final categoryIds = <String, int>{};

    for (final category in _categories) {
      final existing =
          await (db.select(db.categories)
                ..where((table) => table.nombre.equals(category.nombre)))
              .getSingleOrNull();

      int id;

      if (existing == null) {
        id = await db
            .into(db.categories)
            .insert(
              CategoriesCompanion.insert(
                nombre: category.nombre,
                descripcion: category.descripcion,
              ),
            );
      } else {
        id = existing.idCategoria;

        await (db.update(
          db.categories,
        )..where((table) => table.idCategoria.equals(id))).write(
          CategoriesCompanion(
            descripcion: Value(category.descripcion),
            activo: const Value(true),
          ),
        );
      }

      categoryIds[category.nombre] = id;
    }

    // 2. ORGANIZACIONES
    final organizationIds = <String, int>{};

    for (final organization in _organizations) {
      final existing =
          await (db.select(db.organizations)..where(
                (table) =>
                    table.identificador.equals(organization.identificador),
              ))
              .getSingleOrNull();

      int id;

      final companion = OrganizationsCompanion(
        identificador: Value(organization.identificador),
        nombre: Value(organization.nombre),
        tipoOrganizacion: Value(organization.tipo),
        descripcion: Value(organization.descripcion),

        ciudad: organization.ciudad == null
            ? const Value.absent()
            : Value(organization.ciudad!),

        urlOficial: organization.url == null
            ? const Value.absent()
            : Value(organization.url!),

        activo: const Value(true),
      );

      if (existing == null) {
        id = await db.into(db.organizations).insert(companion);
      } else {
        id = existing.idOrganizacion;

        await (db.update(
          db.organizations,
        )..where((table) => table.idOrganizacion.equals(id))).write(companion);
      }

      organizationIds[organization.identificador] = id;
    }

    // 3. UBICACIONES DE LAS ORGANIZACIONES
    for (final location in _locations) {
      final organizationId = organizationIds[location.organizacion];

      if (organizationId == null) {
        throw StateError(
          'No se encontró la organización '
          'de la ubicación ${location.identificador}.',
        );
      }

      final existing =
          await (db.select(db.organizationLocations)..where(
                (table) => table.identificador.equals(location.identificador),
              ))
              .getSingleOrNull();

      final companion = OrganizationLocationsCompanion(
        identificador: Value(location.identificador),
        idOrganizacion: Value(organizationId),
        nombreSede: location.nombreSede == null
            ? const Value.absent()
            : Value(location.nombreSede!),
        ciudad: location.ciudad == null
            ? const Value.absent()
            : Value(location.ciudad!),
        direccion: location.direccion == null
            ? const Value.absent()
            : Value(location.direccion!),
        modalidadAtencion: Value(location.modalidadAtencion),
        estadoUbicacion: Value(location.estadoUbicacion),
        activo: const Value(true),
      );

      if (existing == null) {
        await db.into(db.organizationLocations).insert(companion);
      } else {
        await (db.update(
              db.organizationLocations,
            )..where((table) => table.idUbicacion.equals(existing.idUbicacion)))
            .write(companion);
      }
    }

    // 4. RECURSOS OFICIALES

    // 4. RECURSOS OFICIALES
    for (final resource in _resources) {
      final categoryId = categoryIds[resource.categoria];
      final organizationId = organizationIds[resource.organizacion];

      if (categoryId == null || organizationId == null) {
        throw StateError(
          'No se encontró la categoría o la organización '
          'del recurso ${resource.identificador}.',
        );
      }

      final existing =
          await (db.select(db.officialResources)..where(
                (table) => table.identificador.equals(resource.identificador),
              ))
              .getSingleOrNull();

      final companion = OfficialResourcesCompanion(
        identificador: Value(resource.identificador),
        idCategoria: Value(categoryId),
        idOrganizacion: Value(organizationId),
        titulo: Value(resource.titulo),
        descripcion: Value(resource.descripcion),
        urlOficial: Value(resource.url),
        activo: const Value(true),
      );

      if (existing == null) {
        await db.into(db.officialResources).insert(companion);
      } else {
        await (db.update(db.officialResources)
              ..where((table) => table.idRecurso.equals(existing.idRecurso)))
            .write(companion);
      }
    }
  });
}

// ------------------------------------------------------------
// UBICACIONES DE LAS ORGANIZACIONES
// ------------------------------------------------------------

class _LocationSeed {
  final String identificador;
  final String organizacion;
  final String? nombreSede;
  final String? ciudad;
  final String? direccion;
  final String modalidadAtencion;

  const _LocationSeed({
    required this.identificador,
    required this.organizacion,
    this.nombreSede,
    this.ciudad,
    this.direccion,
    this.modalidadAtencion = 'no_confirmada',
  });

  String get estadoUbicacion => 'pendiente';
}

const _locations = [
  // CONUCRANIA
  _LocationSeed(
    identificador: 'conucrania-madrid',
    organizacion: 'conucrania',
    nombreSede: 'Sede de ConUcrania',
    ciudad: 'Madrid',
    direccion: 'Calle Isabelita Usera, 71, local, 28026 Madrid',
  ),

  // UCRANIA-EUSKADI
  _LocationSeed(
    identificador: 'ucrania-euskadi-bilbao',
    organizacion: 'ucrania-euskadi',
    nombreSede: 'Centro de Bilbao',
    ciudad: 'Bilbao',
    modalidadAtencion: 'cita_previa',
  ),
  _LocationSeed(
    identificador: 'ucrania-euskadi-vitoria',
    organizacion: 'ucrania-euskadi',
    nombreSede: 'Centro de Vitoria-Gasteiz',
    ciudad: 'Vitoria-Gasteiz',
    modalidadAtencion: 'cita_previa',
  ),
  _LocationSeed(
    identificador: 'ucrania-euskadi-donostia',
    organizacion: 'ucrania-euskadi',
    nombreSede: 'Centro de Donostia',
    ciudad: 'Donostia',
    modalidadAtencion: 'cita_previa',
  ),
  _LocationSeed(
    identificador: 'ucrania-euskadi-errenteria',
    organizacion: 'ucrania-euskadi',
    nombreSede: 'Centro de Errenteria',
    ciudad: 'Errenteria',
    modalidadAtencion: 'cita_previa',
  ),

  // ALAS DE UCRANIA
  _LocationSeed(
    identificador: 'alas-ucrania-pamplona',
    organizacion: 'alas-de-ucrania',
    nombreSede: 'Sede de Alas de Ucrania',
    ciudad: 'Pamplona',
    direccion: 'Calle Esquíroz, 24, 31007 Pamplona',
  ),

  // U-ARMONÍA
  _LocationSeed(
    identificador: 'u-armonia-xirivella',
    organizacion: 'u-armonia',
    nombreSede: 'Sede de U-Armonía',
    ciudad: 'Xirivella',
    direccion: 'Calle Montellano, 37, Xirivella, Valencia',
  ),

  // AYUDA UCRANIA DÉNIA
  _LocationSeed(
    identificador: 'ayuda-ucrania-denia',
    organizacion: 'ayuda-ucrania-denia',
    nombreSede: 'Local de Ayuda Ucrania Dénia',
    ciudad: 'Dénia',
    direccion: 'Paseo Saladar, 91, 03700 Dénia',
  ),

  // ACNUR
  _LocationSeed(
    identificador: 'acnur-madrid',
    organizacion: 'acnur',
    nombreSede: 'Oficina de ACNUR España',
    ciudad: 'Madrid',
    direccion: 'Calle Hernani, 59, Madrid',
    modalidadAtencion: 'cita_previa',
  ),

  // EMBAJADA DE UCRANIA
  _LocationSeed(
    identificador: 'embajada-ucrania-madrid',
    organizacion: 'embajada-ucrania',
    nombreSede: 'Embajada de Ucrania en España',
    ciudad: 'Madrid',
    direccion: 'Ronda de Abubilla, 52, 28043 Madrid',
  ),
];

// ------------------------------------------------------------
// CATEGORÍAS
// ------------------------------------------------------------

class _CategorySeed {
  final String nombre;
  final String descripcion;

  const _CategorySeed(this.nombre, this.descripcion);
}

const _categories = [
  _CategorySeed(
    'Salud',
    'Información sobre acceso al sistema sanitario en España, '
        'atención médica, centros de salud, hospitales y servicios '
        'de asistencia sanitaria.',
  ),
  _CategorySeed(
    'Empleo',
    'Información sobre búsqueda de empleo, orientación laboral, '
        'formación para el trabajo, derechos laborales y servicios '
        'de apoyo a la inserción laboral.',
  ),
  _CategorySeed(
    'Educación',
    'Información sobre acceso al sistema educativo español, '
        'escolarización, formación académica, aprendizaje del idioma '
        'y oportunidades educativas.',
  ),
  _CategorySeed(
    'Protección internacional y acogida',
    'Información sobre protección temporal, protección internacional, '
        'asilo, acogida y servicios de orientación para personas '
        'refugiadas y desplazadas.',
  ),
  _CategorySeed(
    'Ayuda humanitaria y apoyo social',
    'Información sobre recursos de primera necesidad, alimentación, '
        'alojamiento, asistencia material y programas de apoyo social '
        'para personas en situación de vulnerabilidad.',
  ),
  _CategorySeed(
    'Asesoramiento jurídico y administrativo',
    'Información y orientación sobre derechos, procedimientos '
        'administrativos, asistencia jurídica y servicios de '
        'asesoramiento para realizar gestiones en España.',
  ),
  _CategorySeed(
    'Atención consular',
    'Información sobre servicios consulares, documentación, '
        'ciudadanía, gestiones oficiales y asistencia a ciudadanos '
        'ucranianos en el extranjero.',
  ),
  _CategorySeed(
    'Integración y apoyo comunitario',
    'Información sobre actividades comunitarias, acompañamiento, '
        'aprendizaje del idioma, participación social y recursos '
        'que facilitan la integración en España.',
  ),
];

// ------------------------------------------------------------
// ORGANIZACIONES
// ------------------------------------------------------------

class _OrganizationSeed {
  final String identificador;
  final String nombre;
  final String tipo;
  final String descripcion;
  final String? ciudad;
  final String? url;

  const _OrganizationSeed({
    required this.identificador,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    this.ciudad,
    this.url,
  });
}

const _organizations = [
  _OrganizationSeed(
    identificador: 'conucrania',
    nombre: 'ConUcrania',
    tipo: 'Asociación comunitaria',
    descripcion:
        'Asociación ucraniana en Madrid e integrante de la Unión KRAI.',
    ciudad: 'Madrid',
    url: 'https://conucrania.com/',
  ),
  _OrganizationSeed(
    identificador: 'ucrania-euskadi',
    nombre: 'Ucrania-Euskadi',
    tipo: 'Asociación cultural',
    descripcion: 'Asociación sociocultural y de cooperación al desarrollo.',
    ciudad: 'Bilbao',
    url: 'https://ucraniaeuskadi.com/',
  ),
  _OrganizationSeed(
    identificador: 'alas-de-ucrania',
    nombre: 'Alas de Ucrania',
    tipo: 'Apoyo comunitario',
    descripcion: 'Asociación ucraniana con presencia en Navarra.',
    ciudad: 'Pamplona',
    url: 'https://alasdeucrania.es/',
  ),
  _OrganizationSeed(
    identificador: 'u-armonia',
    nombre: 'U-Armonía',
    tipo: 'Asociación cultural',
    descripcion: 'Asociación ucraniana de la Comunidad Valenciana.',
    ciudad: 'Valencia',
  ),
  _OrganizationSeed(
    identificador: 'ayuda-ucrania-denia',
    nombre: 'Ayuda Ucrania Dénia',
    tipo: 'Apoyo comunitario',
    descripcion: 'Asociación vinculada a la comunidad ucraniana de Dénia.',
    ciudad: 'Dénia',
    url: 'https://www.uadenia.org/',
  ),
  _OrganizationSeed(
    identificador: 'cruz-roja',
    nombre: 'Cruz Roja Española',
    tipo: 'Organización humanitaria',
    descripcion:
        'Organización humanitaria que desarrolla programas de '
        'atención, acogida y apoyo a personas en situación '
        'de vulnerabilidad.',
    url: 'https://www.cruzroja.es/',
  ),
  _OrganizationSeed(
    identificador: 'acnur',
    nombre: 'ACNUR España',
    tipo: 'Organización internacional',
    descripcion:
        'Agencia de las Naciones Unidas para los Refugiados, '
        'que ofrece información y orientación a personas refugiadas.',
    url: 'https://www.acnur.org/es-es/',
  ),
  _OrganizationSeed(
    identificador: 'caritas',
    nombre: 'Cáritas Española',
    tipo: 'Organización social',
    descripcion:
        'Organización que desarrolla programas de acogida, '
        'acompañamiento y apoyo social.',
    url: 'https://www.caritas.es/',
  ),
  _OrganizationSeed(
    identificador: 'cear',
    nombre: 'CEAR',
    tipo: 'Organización de apoyo a personas refugiadas',
    descripcion:
        'Organización especializada en la defensa de los derechos '
        'de las personas refugiadas y solicitantes de asilo.',
    url: 'https://www.cear.es/',
  ),
  _OrganizationSeed(
    identificador: 'embajada-ucrania',
    nombre: 'Embajada de Ucrania en España',
    tipo: 'Institución diplomática',
    descripcion:
        'Representación diplomática de Ucrania en España que '
        'ofrece información y atención consular.',
    ciudad: 'Madrid',
    url: 'https://spain.mfa.gov.ua/',
  ),
];

// ------------------------------------------------------------
// RECURSOS OFICIALES
// ------------------------------------------------------------

class _ResourceSeed {
  final String identificador;
  final String organizacion;
  final String categoria;
  final String titulo;
  final String descripcion;
  final String url;

  const _ResourceSeed({
    required this.identificador,
    required this.organizacion,
    required this.categoria,
    required this.titulo,
    required this.descripcion,
    required this.url,
  });
}

const _resources = [
  _ResourceSeed(
    identificador: 'cruz-roja-acogida-ucrania',
    organizacion: 'cruz-roja',
    categoria: 'Protección internacional y acogida',
    titulo: 'Acogida e integración de personas refugiadas',
    descripcion:
        'Información sobre acogida e integración de personas '
        'refugiadas, protección temporal y protección internacional.',
    url: 'https://www2.cruzroja.es/ucrania/acogida',
  ),
  _ResourceSeed(
    identificador: 'cruz-roja-atencion-ucrania',
    organizacion: 'cruz-roja',
    categoria: 'Ayuda humanitaria y apoyo social',
    titulo: 'Atención y apoyo a personas procedentes de Ucrania',
    descripcion:
        'Información sobre respuesta humanitaria, acogida, '
        'orientación y canales de contacto de Cruz Roja para '
        'personas afectadas por la crisis de Ucrania.',
    url: 'https://www2.cruzroja.es/ucrania',
  ),
  _ResourceSeed(
    identificador: 'acnur-portal-ayuda-espana',
    organizacion: 'acnur',
    categoria: 'Protección internacional y acogida',
    titulo: 'Portal de ayuda para personas refugiadas en España',
    descripcion:
        'Portal de información de ACNUR con orientación sobre '
        'derechos, servicios disponibles y recursos para personas '
        'refugiadas y solicitantes de asilo en España.',
    url: 'https://help.unhcr.org/spain/',
  ),
  _ResourceSeed(
    identificador: 'acnur-informacion-asilo-espana',
    organizacion: 'acnur',
    categoria: 'Asesoramiento jurídico y administrativo',
    titulo: 'Información sobre el procedimiento de asilo en España',
    descripcion:
        'Información sobre derecho de asilo, protección '
        'internacional, procedimiento en España y organismos '
        'a los que acudir para orientación.',
    url: 'https://www.acnur.org/es-es/acnur-en-espana/el-asilo-en-espana',
  ),
  _ResourceSeed(
    identificador: 'caritas-acogida-migrantes',
    organizacion: 'caritas',
    categoria: 'Protección internacional y acogida',
    titulo: 'Acogida y acompañamiento a personas migrantes',
    descripcion:
        'Información sobre servicios de acogida y acompañamiento '
        'de Cáritas, incluyendo orientación, asesoramiento jurídico, '
        'mediación intercultural y alojamiento temporal, según '
        'programas disponibles en cada diócesis.',
    url: 'https://www.caritas.es/que-hacemos/accion-social/',
  ),
  _ResourceSeed(
    identificador: 'caritas-apoyo-orientacion',
    organizacion: 'caritas',
    categoria: 'Ayuda humanitaria y apoyo social',
    titulo: 'Solicitud de apoyo y orientación social',
    descripcion:
        'Portal para encontrar la Cáritas Diocesana correspondiente '
        'y solicitar orientación sobre necesidades básicas, empleo, '
        'apoyo psicológico, vivienda y asesoramiento jurídico.',
    url: 'https://www.caritas.es/te-ayudamos-apoyo/',
  ),
  _ResourceSeed(
    identificador: 'cear-asesoramiento-juridico',
    organizacion: 'cear',
    categoria: 'Asesoramiento jurídico y administrativo',
    titulo: 'Asesoramiento jurídico para personas refugiadas',
    descripcion:
        'Información sobre asesoramiento jurídico a solicitantes '
        'de asilo, refugiadas, apátridas y desplazadas para conocer '
        'y defender sus derechos y recibir orientación sobre '
        'procedimientos de protección internacional.',
    url: 'https://www.cear.es/sections-post/area-juridica-cear/',
  ),
  _ResourceSeed(
    identificador: 'cear-atencion-social',
    organizacion: 'cear',
    categoria: 'Integración y apoyo comunitario',
    titulo: 'Atención social y acompañamiento para la integración',
    descripcion:
        'Información sobre orientación social, intervención y '
        'acompañamiento para favorecer autonomía e integración '
        'de personas refugiadas, solicitantes de asilo y '
        'migrantes vulnerables.',
    url: 'https://www.cear.es/que-hacemos/area-social/',
  ),
  _ResourceSeed(
    identificador: 'embajada-ucrania-atencion-consular',
    organizacion: 'embajada-ucrania',
    categoria: 'Atención consular',
    titulo: 'Información y atención consular',
    descripcion:
        'Información institucional de la Embajada sobre servicios '
        'consulares, contacto y atención a ciudadanos ucranianos.',
    url: 'https://spain.mfa.gov.ua/es',
  ),
  _ResourceSeed(
    identificador: 'embajada-ucrania-servicios-consulares',
    organizacion: 'embajada-ucrania',
    categoria: 'Atención consular',
    titulo: 'Información sobre trámites y servicios consulares',
    descripcion:
        'Información sobre gestiones consulares, documentación, '
        'ciudadanía, protección de derechos e intereses de ciudadanos '
        'ucranianos en el extranjero y vías de contacto.',
    url: 'https://mfa.gov.ua/es/asuntos-consulares',
  ),
];
