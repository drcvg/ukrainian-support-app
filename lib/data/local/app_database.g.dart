// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idCategoriaMeta = const VerificationMeta(
    'idCategoria',
  );
  @override
  late final GeneratedColumn<int> idCategoria = GeneratedColumn<int>(
    'id_categoria',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activoMeta = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<bool> activo = GeneratedColumn<bool>(
    'activo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idCategoria,
    nombre,
    descripcion,
    activo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_categoria')) {
      context.handle(
        _idCategoriaMeta,
        idCategoria.isAcceptableOrUnknown(
          data['id_categoria']!,
          _idCategoriaMeta,
        ),
      );
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('activo')) {
      context.handle(
        _activoMeta,
        activo.isAcceptableOrUnknown(data['activo']!, _activoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idCategoria};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      idCategoria: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_categoria'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      activo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activo'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int idCategoria;
  final String nombre;
  final String descripcion;
  final bool activo;
  const Category({
    required this.idCategoria,
    required this.nombre,
    required this.descripcion,
    required this.activo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_categoria'] = Variable<int>(idCategoria);
    map['nombre'] = Variable<String>(nombre);
    map['descripcion'] = Variable<String>(descripcion);
    map['activo'] = Variable<bool>(activo);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      idCategoria: Value(idCategoria),
      nombre: Value(nombre),
      descripcion: Value(descripcion),
      activo: Value(activo),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      idCategoria: serializer.fromJson<int>(json['idCategoria']),
      nombre: serializer.fromJson<String>(json['nombre']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      activo: serializer.fromJson<bool>(json['activo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idCategoria': serializer.toJson<int>(idCategoria),
      'nombre': serializer.toJson<String>(nombre),
      'descripcion': serializer.toJson<String>(descripcion),
      'activo': serializer.toJson<bool>(activo),
    };
  }

  Category copyWith({
    int? idCategoria,
    String? nombre,
    String? descripcion,
    bool? activo,
  }) => Category(
    idCategoria: idCategoria ?? this.idCategoria,
    nombre: nombre ?? this.nombre,
    descripcion: descripcion ?? this.descripcion,
    activo: activo ?? this.activo,
  );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      idCategoria: data.idCategoria.present
          ? data.idCategoria.value
          : this.idCategoria,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      activo: data.activo.present ? data.activo.value : this.activo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('idCategoria: $idCategoria, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idCategoria, nombre, descripcion, activo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.idCategoria == this.idCategoria &&
          other.nombre == this.nombre &&
          other.descripcion == this.descripcion &&
          other.activo == this.activo);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> idCategoria;
  final Value<String> nombre;
  final Value<String> descripcion;
  final Value<bool> activo;
  const CategoriesCompanion({
    this.idCategoria = const Value.absent(),
    this.nombre = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.activo = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.idCategoria = const Value.absent(),
    required String nombre,
    required String descripcion,
    this.activo = const Value.absent(),
  }) : nombre = Value(nombre),
       descripcion = Value(descripcion);
  static Insertable<Category> custom({
    Expression<int>? idCategoria,
    Expression<String>? nombre,
    Expression<String>? descripcion,
    Expression<bool>? activo,
  }) {
    return RawValuesInsertable({
      if (idCategoria != null) 'id_categoria': idCategoria,
      if (nombre != null) 'nombre': nombre,
      if (descripcion != null) 'descripcion': descripcion,
      if (activo != null) 'activo': activo,
    });
  }

  CategoriesCompanion copyWith({
    Value<int>? idCategoria,
    Value<String>? nombre,
    Value<String>? descripcion,
    Value<bool>? activo,
  }) {
    return CategoriesCompanion(
      idCategoria: idCategoria ?? this.idCategoria,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      activo: activo ?? this.activo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idCategoria.present) {
      map['id_categoria'] = Variable<int>(idCategoria.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (activo.present) {
      map['activo'] = Variable<bool>(activo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('idCategoria: $idCategoria, ')
          ..write('nombre: $nombre, ')
          ..write('descripcion: $descripcion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }
}

class $OrganizationsTable extends Organizations
    with TableInfo<$OrganizationsTable, Organization> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrganizacionMeta = const VerificationMeta(
    'idOrganizacion',
  );
  @override
  late final GeneratedColumn<int> idOrganizacion = GeneratedColumn<int>(
    'id_organizacion',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _identificadorMeta = const VerificationMeta(
    'identificador',
  );
  @override
  late final GeneratedColumn<String> identificador = GeneratedColumn<String>(
    'identificador',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoOrganizacionMeta = const VerificationMeta(
    'tipoOrganizacion',
  );
  @override
  late final GeneratedColumn<String> tipoOrganizacion = GeneratedColumn<String>(
    'tipo_organizacion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ciudadMeta = const VerificationMeta('ciudad');
  @override
  late final GeneratedColumn<String> ciudad = GeneratedColumn<String>(
    'ciudad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlOficialMeta = const VerificationMeta(
    'urlOficial',
  );
  @override
  late final GeneratedColumn<String> urlOficial = GeneratedColumn<String>(
    'url_oficial',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modalidadAtencionMeta = const VerificationMeta(
    'modalidadAtencion',
  );
  @override
  late final GeneratedColumn<String> modalidadAtencion =
      GeneratedColumn<String>(
        'modalidad_atencion',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('no_confirmada'),
      );
  static const VerificationMeta _estadoUbicacionMeta = const VerificationMeta(
    'estadoUbicacion',
  );
  @override
  late final GeneratedColumn<String> estadoUbicacion = GeneratedColumn<String>(
    'estado_ubicacion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pendiente'),
  );
  static const VerificationMeta _activoMeta = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<bool> activo = GeneratedColumn<bool>(
    'activo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idOrganizacion,
    identificador,
    nombre,
    tipoOrganizacion,
    descripcion,
    ciudad,
    direccion,
    telefono,
    email,
    urlOficial,
    modalidadAtencion,
    estadoUbicacion,
    activo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Organization> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_organizacion')) {
      context.handle(
        _idOrganizacionMeta,
        idOrganizacion.isAcceptableOrUnknown(
          data['id_organizacion']!,
          _idOrganizacionMeta,
        ),
      );
    }
    if (data.containsKey('identificador')) {
      context.handle(
        _identificadorMeta,
        identificador.isAcceptableOrUnknown(
          data['identificador']!,
          _identificadorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_identificadorMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('tipo_organizacion')) {
      context.handle(
        _tipoOrganizacionMeta,
        tipoOrganizacion.isAcceptableOrUnknown(
          data['tipo_organizacion']!,
          _tipoOrganizacionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoOrganizacionMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('ciudad')) {
      context.handle(
        _ciudadMeta,
        ciudad.isAcceptableOrUnknown(data['ciudad']!, _ciudadMeta),
      );
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('url_oficial')) {
      context.handle(
        _urlOficialMeta,
        urlOficial.isAcceptableOrUnknown(data['url_oficial']!, _urlOficialMeta),
      );
    }
    if (data.containsKey('modalidad_atencion')) {
      context.handle(
        _modalidadAtencionMeta,
        modalidadAtencion.isAcceptableOrUnknown(
          data['modalidad_atencion']!,
          _modalidadAtencionMeta,
        ),
      );
    }
    if (data.containsKey('estado_ubicacion')) {
      context.handle(
        _estadoUbicacionMeta,
        estadoUbicacion.isAcceptableOrUnknown(
          data['estado_ubicacion']!,
          _estadoUbicacionMeta,
        ),
      );
    }
    if (data.containsKey('activo')) {
      context.handle(
        _activoMeta,
        activo.isAcceptableOrUnknown(data['activo']!, _activoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrganizacion};
  @override
  Organization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Organization(
      idOrganizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organizacion'],
      )!,
      identificador: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identificador'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      tipoOrganizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo_organizacion'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      ciudad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ciudad'],
      ),
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      urlOficial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_oficial'],
      ),
      modalidadAtencion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modalidad_atencion'],
      )!,
      estadoUbicacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado_ubicacion'],
      )!,
      activo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activo'],
      )!,
    );
  }

  @override
  $OrganizationsTable createAlias(String alias) {
    return $OrganizationsTable(attachedDatabase, alias);
  }
}

class Organization extends DataClass implements Insertable<Organization> {
  final int idOrganizacion;
  final String identificador;
  final String nombre;
  final String tipoOrganizacion;
  final String descripcion;
  final String? ciudad;
  final String? direccion;
  final String? telefono;
  final String? email;
  final String? urlOficial;
  final String modalidadAtencion;
  final String estadoUbicacion;
  final bool activo;
  const Organization({
    required this.idOrganizacion,
    required this.identificador,
    required this.nombre,
    required this.tipoOrganizacion,
    required this.descripcion,
    this.ciudad,
    this.direccion,
    this.telefono,
    this.email,
    this.urlOficial,
    required this.modalidadAtencion,
    required this.estadoUbicacion,
    required this.activo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_organizacion'] = Variable<int>(idOrganizacion);
    map['identificador'] = Variable<String>(identificador);
    map['nombre'] = Variable<String>(nombre);
    map['tipo_organizacion'] = Variable<String>(tipoOrganizacion);
    map['descripcion'] = Variable<String>(descripcion);
    if (!nullToAbsent || ciudad != null) {
      map['ciudad'] = Variable<String>(ciudad);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || urlOficial != null) {
      map['url_oficial'] = Variable<String>(urlOficial);
    }
    map['modalidad_atencion'] = Variable<String>(modalidadAtencion);
    map['estado_ubicacion'] = Variable<String>(estadoUbicacion);
    map['activo'] = Variable<bool>(activo);
    return map;
  }

  OrganizationsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationsCompanion(
      idOrganizacion: Value(idOrganizacion),
      identificador: Value(identificador),
      nombre: Value(nombre),
      tipoOrganizacion: Value(tipoOrganizacion),
      descripcion: Value(descripcion),
      ciudad: ciudad == null && nullToAbsent
          ? const Value.absent()
          : Value(ciudad),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      urlOficial: urlOficial == null && nullToAbsent
          ? const Value.absent()
          : Value(urlOficial),
      modalidadAtencion: Value(modalidadAtencion),
      estadoUbicacion: Value(estadoUbicacion),
      activo: Value(activo),
    );
  }

  factory Organization.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Organization(
      idOrganizacion: serializer.fromJson<int>(json['idOrganizacion']),
      identificador: serializer.fromJson<String>(json['identificador']),
      nombre: serializer.fromJson<String>(json['nombre']),
      tipoOrganizacion: serializer.fromJson<String>(json['tipoOrganizacion']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      ciudad: serializer.fromJson<String?>(json['ciudad']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      email: serializer.fromJson<String?>(json['email']),
      urlOficial: serializer.fromJson<String?>(json['urlOficial']),
      modalidadAtencion: serializer.fromJson<String>(json['modalidadAtencion']),
      estadoUbicacion: serializer.fromJson<String>(json['estadoUbicacion']),
      activo: serializer.fromJson<bool>(json['activo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrganizacion': serializer.toJson<int>(idOrganizacion),
      'identificador': serializer.toJson<String>(identificador),
      'nombre': serializer.toJson<String>(nombre),
      'tipoOrganizacion': serializer.toJson<String>(tipoOrganizacion),
      'descripcion': serializer.toJson<String>(descripcion),
      'ciudad': serializer.toJson<String?>(ciudad),
      'direccion': serializer.toJson<String?>(direccion),
      'telefono': serializer.toJson<String?>(telefono),
      'email': serializer.toJson<String?>(email),
      'urlOficial': serializer.toJson<String?>(urlOficial),
      'modalidadAtencion': serializer.toJson<String>(modalidadAtencion),
      'estadoUbicacion': serializer.toJson<String>(estadoUbicacion),
      'activo': serializer.toJson<bool>(activo),
    };
  }

  Organization copyWith({
    int? idOrganizacion,
    String? identificador,
    String? nombre,
    String? tipoOrganizacion,
    String? descripcion,
    Value<String?> ciudad = const Value.absent(),
    Value<String?> direccion = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> urlOficial = const Value.absent(),
    String? modalidadAtencion,
    String? estadoUbicacion,
    bool? activo,
  }) => Organization(
    idOrganizacion: idOrganizacion ?? this.idOrganizacion,
    identificador: identificador ?? this.identificador,
    nombre: nombre ?? this.nombre,
    tipoOrganizacion: tipoOrganizacion ?? this.tipoOrganizacion,
    descripcion: descripcion ?? this.descripcion,
    ciudad: ciudad.present ? ciudad.value : this.ciudad,
    direccion: direccion.present ? direccion.value : this.direccion,
    telefono: telefono.present ? telefono.value : this.telefono,
    email: email.present ? email.value : this.email,
    urlOficial: urlOficial.present ? urlOficial.value : this.urlOficial,
    modalidadAtencion: modalidadAtencion ?? this.modalidadAtencion,
    estadoUbicacion: estadoUbicacion ?? this.estadoUbicacion,
    activo: activo ?? this.activo,
  );
  Organization copyWithCompanion(OrganizationsCompanion data) {
    return Organization(
      idOrganizacion: data.idOrganizacion.present
          ? data.idOrganizacion.value
          : this.idOrganizacion,
      identificador: data.identificador.present
          ? data.identificador.value
          : this.identificador,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      tipoOrganizacion: data.tipoOrganizacion.present
          ? data.tipoOrganizacion.value
          : this.tipoOrganizacion,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      ciudad: data.ciudad.present ? data.ciudad.value : this.ciudad,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      email: data.email.present ? data.email.value : this.email,
      urlOficial: data.urlOficial.present
          ? data.urlOficial.value
          : this.urlOficial,
      modalidadAtencion: data.modalidadAtencion.present
          ? data.modalidadAtencion.value
          : this.modalidadAtencion,
      estadoUbicacion: data.estadoUbicacion.present
          ? data.estadoUbicacion.value
          : this.estadoUbicacion,
      activo: data.activo.present ? data.activo.value : this.activo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Organization(')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('identificador: $identificador, ')
          ..write('nombre: $nombre, ')
          ..write('tipoOrganizacion: $tipoOrganizacion, ')
          ..write('descripcion: $descripcion, ')
          ..write('ciudad: $ciudad, ')
          ..write('direccion: $direccion, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('urlOficial: $urlOficial, ')
          ..write('modalidadAtencion: $modalidadAtencion, ')
          ..write('estadoUbicacion: $estadoUbicacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idOrganizacion,
    identificador,
    nombre,
    tipoOrganizacion,
    descripcion,
    ciudad,
    direccion,
    telefono,
    email,
    urlOficial,
    modalidadAtencion,
    estadoUbicacion,
    activo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          other.idOrganizacion == this.idOrganizacion &&
          other.identificador == this.identificador &&
          other.nombre == this.nombre &&
          other.tipoOrganizacion == this.tipoOrganizacion &&
          other.descripcion == this.descripcion &&
          other.ciudad == this.ciudad &&
          other.direccion == this.direccion &&
          other.telefono == this.telefono &&
          other.email == this.email &&
          other.urlOficial == this.urlOficial &&
          other.modalidadAtencion == this.modalidadAtencion &&
          other.estadoUbicacion == this.estadoUbicacion &&
          other.activo == this.activo);
}

class OrganizationsCompanion extends UpdateCompanion<Organization> {
  final Value<int> idOrganizacion;
  final Value<String> identificador;
  final Value<String> nombre;
  final Value<String> tipoOrganizacion;
  final Value<String> descripcion;
  final Value<String?> ciudad;
  final Value<String?> direccion;
  final Value<String?> telefono;
  final Value<String?> email;
  final Value<String?> urlOficial;
  final Value<String> modalidadAtencion;
  final Value<String> estadoUbicacion;
  final Value<bool> activo;
  const OrganizationsCompanion({
    this.idOrganizacion = const Value.absent(),
    this.identificador = const Value.absent(),
    this.nombre = const Value.absent(),
    this.tipoOrganizacion = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.ciudad = const Value.absent(),
    this.direccion = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.urlOficial = const Value.absent(),
    this.modalidadAtencion = const Value.absent(),
    this.estadoUbicacion = const Value.absent(),
    this.activo = const Value.absent(),
  });
  OrganizationsCompanion.insert({
    this.idOrganizacion = const Value.absent(),
    required String identificador,
    required String nombre,
    required String tipoOrganizacion,
    required String descripcion,
    this.ciudad = const Value.absent(),
    this.direccion = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.urlOficial = const Value.absent(),
    this.modalidadAtencion = const Value.absent(),
    this.estadoUbicacion = const Value.absent(),
    this.activo = const Value.absent(),
  }) : identificador = Value(identificador),
       nombre = Value(nombre),
       tipoOrganizacion = Value(tipoOrganizacion),
       descripcion = Value(descripcion);
  static Insertable<Organization> custom({
    Expression<int>? idOrganizacion,
    Expression<String>? identificador,
    Expression<String>? nombre,
    Expression<String>? tipoOrganizacion,
    Expression<String>? descripcion,
    Expression<String>? ciudad,
    Expression<String>? direccion,
    Expression<String>? telefono,
    Expression<String>? email,
    Expression<String>? urlOficial,
    Expression<String>? modalidadAtencion,
    Expression<String>? estadoUbicacion,
    Expression<bool>? activo,
  }) {
    return RawValuesInsertable({
      if (idOrganizacion != null) 'id_organizacion': idOrganizacion,
      if (identificador != null) 'identificador': identificador,
      if (nombre != null) 'nombre': nombre,
      if (tipoOrganizacion != null) 'tipo_organizacion': tipoOrganizacion,
      if (descripcion != null) 'descripcion': descripcion,
      if (ciudad != null) 'ciudad': ciudad,
      if (direccion != null) 'direccion': direccion,
      if (telefono != null) 'telefono': telefono,
      if (email != null) 'email': email,
      if (urlOficial != null) 'url_oficial': urlOficial,
      if (modalidadAtencion != null) 'modalidad_atencion': modalidadAtencion,
      if (estadoUbicacion != null) 'estado_ubicacion': estadoUbicacion,
      if (activo != null) 'activo': activo,
    });
  }

  OrganizationsCompanion copyWith({
    Value<int>? idOrganizacion,
    Value<String>? identificador,
    Value<String>? nombre,
    Value<String>? tipoOrganizacion,
    Value<String>? descripcion,
    Value<String?>? ciudad,
    Value<String?>? direccion,
    Value<String?>? telefono,
    Value<String?>? email,
    Value<String?>? urlOficial,
    Value<String>? modalidadAtencion,
    Value<String>? estadoUbicacion,
    Value<bool>? activo,
  }) {
    return OrganizationsCompanion(
      idOrganizacion: idOrganizacion ?? this.idOrganizacion,
      identificador: identificador ?? this.identificador,
      nombre: nombre ?? this.nombre,
      tipoOrganizacion: tipoOrganizacion ?? this.tipoOrganizacion,
      descripcion: descripcion ?? this.descripcion,
      ciudad: ciudad ?? this.ciudad,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      urlOficial: urlOficial ?? this.urlOficial,
      modalidadAtencion: modalidadAtencion ?? this.modalidadAtencion,
      estadoUbicacion: estadoUbicacion ?? this.estadoUbicacion,
      activo: activo ?? this.activo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrganizacion.present) {
      map['id_organizacion'] = Variable<int>(idOrganizacion.value);
    }
    if (identificador.present) {
      map['identificador'] = Variable<String>(identificador.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (tipoOrganizacion.present) {
      map['tipo_organizacion'] = Variable<String>(tipoOrganizacion.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (ciudad.present) {
      map['ciudad'] = Variable<String>(ciudad.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (urlOficial.present) {
      map['url_oficial'] = Variable<String>(urlOficial.value);
    }
    if (modalidadAtencion.present) {
      map['modalidad_atencion'] = Variable<String>(modalidadAtencion.value);
    }
    if (estadoUbicacion.present) {
      map['estado_ubicacion'] = Variable<String>(estadoUbicacion.value);
    }
    if (activo.present) {
      map['activo'] = Variable<bool>(activo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsCompanion(')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('identificador: $identificador, ')
          ..write('nombre: $nombre, ')
          ..write('tipoOrganizacion: $tipoOrganizacion, ')
          ..write('descripcion: $descripcion, ')
          ..write('ciudad: $ciudad, ')
          ..write('direccion: $direccion, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('urlOficial: $urlOficial, ')
          ..write('modalidadAtencion: $modalidadAtencion, ')
          ..write('estadoUbicacion: $estadoUbicacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }
}

class $OrganizationLocationsTable extends OrganizationLocations
    with TableInfo<$OrganizationLocationsTable, OrganizationLocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationLocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUbicacionMeta = const VerificationMeta(
    'idUbicacion',
  );
  @override
  late final GeneratedColumn<int> idUbicacion = GeneratedColumn<int>(
    'id_ubicacion',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _identificadorMeta = const VerificationMeta(
    'identificador',
  );
  @override
  late final GeneratedColumn<String> identificador = GeneratedColumn<String>(
    'identificador',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idOrganizacionMeta = const VerificationMeta(
    'idOrganizacion',
  );
  @override
  late final GeneratedColumn<int> idOrganizacion = GeneratedColumn<int>(
    'id_organizacion',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organizations (id_organizacion) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nombreSedeMeta = const VerificationMeta(
    'nombreSede',
  );
  @override
  late final GeneratedColumn<String> nombreSede = GeneratedColumn<String>(
    'nombre_sede',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ciudadMeta = const VerificationMeta('ciudad');
  @override
  late final GeneratedColumn<String> ciudad = GeneratedColumn<String>(
    'ciudad',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _direccionMeta = const VerificationMeta(
    'direccion',
  );
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
    'direccion',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modalidadAtencionMeta = const VerificationMeta(
    'modalidadAtencion',
  );
  @override
  late final GeneratedColumn<String> modalidadAtencion =
      GeneratedColumn<String>(
        'modalidad_atencion',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('no_confirmada'),
      );
  static const VerificationMeta _estadoUbicacionMeta = const VerificationMeta(
    'estadoUbicacion',
  );
  @override
  late final GeneratedColumn<String> estadoUbicacion = GeneratedColumn<String>(
    'estado_ubicacion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pendiente'),
  );
  static const VerificationMeta _urlFuenteMeta = const VerificationMeta(
    'urlFuente',
  );
  @override
  late final GeneratedColumn<String> urlFuente = GeneratedColumn<String>(
    'url_fuente',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaVerificacionMeta = const VerificationMeta(
    'fechaVerificacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaVerificacion =
      GeneratedColumn<DateTime>(
        'fecha_verificacion',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _activoMeta = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<bool> activo = GeneratedColumn<bool>(
    'activo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idUbicacion,
    identificador,
    idOrganizacion,
    nombreSede,
    ciudad,
    direccion,
    telefono,
    email,
    modalidadAtencion,
    estadoUbicacion,
    urlFuente,
    fechaVerificacion,
    activo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organization_locations';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganizationLocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ubicacion')) {
      context.handle(
        _idUbicacionMeta,
        idUbicacion.isAcceptableOrUnknown(
          data['id_ubicacion']!,
          _idUbicacionMeta,
        ),
      );
    }
    if (data.containsKey('identificador')) {
      context.handle(
        _identificadorMeta,
        identificador.isAcceptableOrUnknown(
          data['identificador']!,
          _identificadorMeta,
        ),
      );
    }
    if (data.containsKey('id_organizacion')) {
      context.handle(
        _idOrganizacionMeta,
        idOrganizacion.isAcceptableOrUnknown(
          data['id_organizacion']!,
          _idOrganizacionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOrganizacionMeta);
    }
    if (data.containsKey('nombre_sede')) {
      context.handle(
        _nombreSedeMeta,
        nombreSede.isAcceptableOrUnknown(data['nombre_sede']!, _nombreSedeMeta),
      );
    }
    if (data.containsKey('ciudad')) {
      context.handle(
        _ciudadMeta,
        ciudad.isAcceptableOrUnknown(data['ciudad']!, _ciudadMeta),
      );
    }
    if (data.containsKey('direccion')) {
      context.handle(
        _direccionMeta,
        direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('modalidad_atencion')) {
      context.handle(
        _modalidadAtencionMeta,
        modalidadAtencion.isAcceptableOrUnknown(
          data['modalidad_atencion']!,
          _modalidadAtencionMeta,
        ),
      );
    }
    if (data.containsKey('estado_ubicacion')) {
      context.handle(
        _estadoUbicacionMeta,
        estadoUbicacion.isAcceptableOrUnknown(
          data['estado_ubicacion']!,
          _estadoUbicacionMeta,
        ),
      );
    }
    if (data.containsKey('url_fuente')) {
      context.handle(
        _urlFuenteMeta,
        urlFuente.isAcceptableOrUnknown(data['url_fuente']!, _urlFuenteMeta),
      );
    }
    if (data.containsKey('fecha_verificacion')) {
      context.handle(
        _fechaVerificacionMeta,
        fechaVerificacion.isAcceptableOrUnknown(
          data['fecha_verificacion']!,
          _fechaVerificacionMeta,
        ),
      );
    }
    if (data.containsKey('activo')) {
      context.handle(
        _activoMeta,
        activo.isAcceptableOrUnknown(data['activo']!, _activoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUbicacion};
  @override
  OrganizationLocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationLocation(
      idUbicacion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_ubicacion'],
      )!,
      identificador: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identificador'],
      ),
      idOrganizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organizacion'],
      )!,
      nombreSede: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre_sede'],
      ),
      ciudad: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ciudad'],
      ),
      direccion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      modalidadAtencion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modalidad_atencion'],
      )!,
      estadoUbicacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado_ubicacion'],
      )!,
      urlFuente: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_fuente'],
      ),
      fechaVerificacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_verificacion'],
      ),
      activo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activo'],
      )!,
    );
  }

  @override
  $OrganizationLocationsTable createAlias(String alias) {
    return $OrganizationLocationsTable(attachedDatabase, alias);
  }
}

class OrganizationLocation extends DataClass
    implements Insertable<OrganizationLocation> {
  final int idUbicacion;
  final String? identificador;
  final int idOrganizacion;
  final String? nombreSede;
  final String? ciudad;
  final String? direccion;
  final String? telefono;
  final String? email;
  final String modalidadAtencion;
  final String estadoUbicacion;
  final String? urlFuente;
  final DateTime? fechaVerificacion;
  final bool activo;
  const OrganizationLocation({
    required this.idUbicacion,
    this.identificador,
    required this.idOrganizacion,
    this.nombreSede,
    this.ciudad,
    this.direccion,
    this.telefono,
    this.email,
    required this.modalidadAtencion,
    required this.estadoUbicacion,
    this.urlFuente,
    this.fechaVerificacion,
    required this.activo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ubicacion'] = Variable<int>(idUbicacion);
    if (!nullToAbsent || identificador != null) {
      map['identificador'] = Variable<String>(identificador);
    }
    map['id_organizacion'] = Variable<int>(idOrganizacion);
    if (!nullToAbsent || nombreSede != null) {
      map['nombre_sede'] = Variable<String>(nombreSede);
    }
    if (!nullToAbsent || ciudad != null) {
      map['ciudad'] = Variable<String>(ciudad);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['modalidad_atencion'] = Variable<String>(modalidadAtencion);
    map['estado_ubicacion'] = Variable<String>(estadoUbicacion);
    if (!nullToAbsent || urlFuente != null) {
      map['url_fuente'] = Variable<String>(urlFuente);
    }
    if (!nullToAbsent || fechaVerificacion != null) {
      map['fecha_verificacion'] = Variable<DateTime>(fechaVerificacion);
    }
    map['activo'] = Variable<bool>(activo);
    return map;
  }

  OrganizationLocationsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationLocationsCompanion(
      idUbicacion: Value(idUbicacion),
      identificador: identificador == null && nullToAbsent
          ? const Value.absent()
          : Value(identificador),
      idOrganizacion: Value(idOrganizacion),
      nombreSede: nombreSede == null && nullToAbsent
          ? const Value.absent()
          : Value(nombreSede),
      ciudad: ciudad == null && nullToAbsent
          ? const Value.absent()
          : Value(ciudad),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      modalidadAtencion: Value(modalidadAtencion),
      estadoUbicacion: Value(estadoUbicacion),
      urlFuente: urlFuente == null && nullToAbsent
          ? const Value.absent()
          : Value(urlFuente),
      fechaVerificacion: fechaVerificacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaVerificacion),
      activo: Value(activo),
    );
  }

  factory OrganizationLocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationLocation(
      idUbicacion: serializer.fromJson<int>(json['idUbicacion']),
      identificador: serializer.fromJson<String?>(json['identificador']),
      idOrganizacion: serializer.fromJson<int>(json['idOrganizacion']),
      nombreSede: serializer.fromJson<String?>(json['nombreSede']),
      ciudad: serializer.fromJson<String?>(json['ciudad']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      email: serializer.fromJson<String?>(json['email']),
      modalidadAtencion: serializer.fromJson<String>(json['modalidadAtencion']),
      estadoUbicacion: serializer.fromJson<String>(json['estadoUbicacion']),
      urlFuente: serializer.fromJson<String?>(json['urlFuente']),
      fechaVerificacion: serializer.fromJson<DateTime?>(
        json['fechaVerificacion'],
      ),
      activo: serializer.fromJson<bool>(json['activo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUbicacion': serializer.toJson<int>(idUbicacion),
      'identificador': serializer.toJson<String?>(identificador),
      'idOrganizacion': serializer.toJson<int>(idOrganizacion),
      'nombreSede': serializer.toJson<String?>(nombreSede),
      'ciudad': serializer.toJson<String?>(ciudad),
      'direccion': serializer.toJson<String?>(direccion),
      'telefono': serializer.toJson<String?>(telefono),
      'email': serializer.toJson<String?>(email),
      'modalidadAtencion': serializer.toJson<String>(modalidadAtencion),
      'estadoUbicacion': serializer.toJson<String>(estadoUbicacion),
      'urlFuente': serializer.toJson<String?>(urlFuente),
      'fechaVerificacion': serializer.toJson<DateTime?>(fechaVerificacion),
      'activo': serializer.toJson<bool>(activo),
    };
  }

  OrganizationLocation copyWith({
    int? idUbicacion,
    Value<String?> identificador = const Value.absent(),
    int? idOrganizacion,
    Value<String?> nombreSede = const Value.absent(),
    Value<String?> ciudad = const Value.absent(),
    Value<String?> direccion = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
    Value<String?> email = const Value.absent(),
    String? modalidadAtencion,
    String? estadoUbicacion,
    Value<String?> urlFuente = const Value.absent(),
    Value<DateTime?> fechaVerificacion = const Value.absent(),
    bool? activo,
  }) => OrganizationLocation(
    idUbicacion: idUbicacion ?? this.idUbicacion,
    identificador: identificador.present
        ? identificador.value
        : this.identificador,
    idOrganizacion: idOrganizacion ?? this.idOrganizacion,
    nombreSede: nombreSede.present ? nombreSede.value : this.nombreSede,
    ciudad: ciudad.present ? ciudad.value : this.ciudad,
    direccion: direccion.present ? direccion.value : this.direccion,
    telefono: telefono.present ? telefono.value : this.telefono,
    email: email.present ? email.value : this.email,
    modalidadAtencion: modalidadAtencion ?? this.modalidadAtencion,
    estadoUbicacion: estadoUbicacion ?? this.estadoUbicacion,
    urlFuente: urlFuente.present ? urlFuente.value : this.urlFuente,
    fechaVerificacion: fechaVerificacion.present
        ? fechaVerificacion.value
        : this.fechaVerificacion,
    activo: activo ?? this.activo,
  );
  OrganizationLocation copyWithCompanion(OrganizationLocationsCompanion data) {
    return OrganizationLocation(
      idUbicacion: data.idUbicacion.present
          ? data.idUbicacion.value
          : this.idUbicacion,
      identificador: data.identificador.present
          ? data.identificador.value
          : this.identificador,
      idOrganizacion: data.idOrganizacion.present
          ? data.idOrganizacion.value
          : this.idOrganizacion,
      nombreSede: data.nombreSede.present
          ? data.nombreSede.value
          : this.nombreSede,
      ciudad: data.ciudad.present ? data.ciudad.value : this.ciudad,
      direccion: data.direccion.present ? data.direccion.value : this.direccion,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      email: data.email.present ? data.email.value : this.email,
      modalidadAtencion: data.modalidadAtencion.present
          ? data.modalidadAtencion.value
          : this.modalidadAtencion,
      estadoUbicacion: data.estadoUbicacion.present
          ? data.estadoUbicacion.value
          : this.estadoUbicacion,
      urlFuente: data.urlFuente.present ? data.urlFuente.value : this.urlFuente,
      fechaVerificacion: data.fechaVerificacion.present
          ? data.fechaVerificacion.value
          : this.fechaVerificacion,
      activo: data.activo.present ? data.activo.value : this.activo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationLocation(')
          ..write('idUbicacion: $idUbicacion, ')
          ..write('identificador: $identificador, ')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('nombreSede: $nombreSede, ')
          ..write('ciudad: $ciudad, ')
          ..write('direccion: $direccion, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('modalidadAtencion: $modalidadAtencion, ')
          ..write('estadoUbicacion: $estadoUbicacion, ')
          ..write('urlFuente: $urlFuente, ')
          ..write('fechaVerificacion: $fechaVerificacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idUbicacion,
    identificador,
    idOrganizacion,
    nombreSede,
    ciudad,
    direccion,
    telefono,
    email,
    modalidadAtencion,
    estadoUbicacion,
    urlFuente,
    fechaVerificacion,
    activo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationLocation &&
          other.idUbicacion == this.idUbicacion &&
          other.identificador == this.identificador &&
          other.idOrganizacion == this.idOrganizacion &&
          other.nombreSede == this.nombreSede &&
          other.ciudad == this.ciudad &&
          other.direccion == this.direccion &&
          other.telefono == this.telefono &&
          other.email == this.email &&
          other.modalidadAtencion == this.modalidadAtencion &&
          other.estadoUbicacion == this.estadoUbicacion &&
          other.urlFuente == this.urlFuente &&
          other.fechaVerificacion == this.fechaVerificacion &&
          other.activo == this.activo);
}

class OrganizationLocationsCompanion
    extends UpdateCompanion<OrganizationLocation> {
  final Value<int> idUbicacion;
  final Value<String?> identificador;
  final Value<int> idOrganizacion;
  final Value<String?> nombreSede;
  final Value<String?> ciudad;
  final Value<String?> direccion;
  final Value<String?> telefono;
  final Value<String?> email;
  final Value<String> modalidadAtencion;
  final Value<String> estadoUbicacion;
  final Value<String?> urlFuente;
  final Value<DateTime?> fechaVerificacion;
  final Value<bool> activo;
  const OrganizationLocationsCompanion({
    this.idUbicacion = const Value.absent(),
    this.identificador = const Value.absent(),
    this.idOrganizacion = const Value.absent(),
    this.nombreSede = const Value.absent(),
    this.ciudad = const Value.absent(),
    this.direccion = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.modalidadAtencion = const Value.absent(),
    this.estadoUbicacion = const Value.absent(),
    this.urlFuente = const Value.absent(),
    this.fechaVerificacion = const Value.absent(),
    this.activo = const Value.absent(),
  });
  OrganizationLocationsCompanion.insert({
    this.idUbicacion = const Value.absent(),
    this.identificador = const Value.absent(),
    required int idOrganizacion,
    this.nombreSede = const Value.absent(),
    this.ciudad = const Value.absent(),
    this.direccion = const Value.absent(),
    this.telefono = const Value.absent(),
    this.email = const Value.absent(),
    this.modalidadAtencion = const Value.absent(),
    this.estadoUbicacion = const Value.absent(),
    this.urlFuente = const Value.absent(),
    this.fechaVerificacion = const Value.absent(),
    this.activo = const Value.absent(),
  }) : idOrganizacion = Value(idOrganizacion);
  static Insertable<OrganizationLocation> custom({
    Expression<int>? idUbicacion,
    Expression<String>? identificador,
    Expression<int>? idOrganizacion,
    Expression<String>? nombreSede,
    Expression<String>? ciudad,
    Expression<String>? direccion,
    Expression<String>? telefono,
    Expression<String>? email,
    Expression<String>? modalidadAtencion,
    Expression<String>? estadoUbicacion,
    Expression<String>? urlFuente,
    Expression<DateTime>? fechaVerificacion,
    Expression<bool>? activo,
  }) {
    return RawValuesInsertable({
      if (idUbicacion != null) 'id_ubicacion': idUbicacion,
      if (identificador != null) 'identificador': identificador,
      if (idOrganizacion != null) 'id_organizacion': idOrganizacion,
      if (nombreSede != null) 'nombre_sede': nombreSede,
      if (ciudad != null) 'ciudad': ciudad,
      if (direccion != null) 'direccion': direccion,
      if (telefono != null) 'telefono': telefono,
      if (email != null) 'email': email,
      if (modalidadAtencion != null) 'modalidad_atencion': modalidadAtencion,
      if (estadoUbicacion != null) 'estado_ubicacion': estadoUbicacion,
      if (urlFuente != null) 'url_fuente': urlFuente,
      if (fechaVerificacion != null) 'fecha_verificacion': fechaVerificacion,
      if (activo != null) 'activo': activo,
    });
  }

  OrganizationLocationsCompanion copyWith({
    Value<int>? idUbicacion,
    Value<String?>? identificador,
    Value<int>? idOrganizacion,
    Value<String?>? nombreSede,
    Value<String?>? ciudad,
    Value<String?>? direccion,
    Value<String?>? telefono,
    Value<String?>? email,
    Value<String>? modalidadAtencion,
    Value<String>? estadoUbicacion,
    Value<String?>? urlFuente,
    Value<DateTime?>? fechaVerificacion,
    Value<bool>? activo,
  }) {
    return OrganizationLocationsCompanion(
      idUbicacion: idUbicacion ?? this.idUbicacion,
      identificador: identificador ?? this.identificador,
      idOrganizacion: idOrganizacion ?? this.idOrganizacion,
      nombreSede: nombreSede ?? this.nombreSede,
      ciudad: ciudad ?? this.ciudad,
      direccion: direccion ?? this.direccion,
      telefono: telefono ?? this.telefono,
      email: email ?? this.email,
      modalidadAtencion: modalidadAtencion ?? this.modalidadAtencion,
      estadoUbicacion: estadoUbicacion ?? this.estadoUbicacion,
      urlFuente: urlFuente ?? this.urlFuente,
      fechaVerificacion: fechaVerificacion ?? this.fechaVerificacion,
      activo: activo ?? this.activo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUbicacion.present) {
      map['id_ubicacion'] = Variable<int>(idUbicacion.value);
    }
    if (identificador.present) {
      map['identificador'] = Variable<String>(identificador.value);
    }
    if (idOrganizacion.present) {
      map['id_organizacion'] = Variable<int>(idOrganizacion.value);
    }
    if (nombreSede.present) {
      map['nombre_sede'] = Variable<String>(nombreSede.value);
    }
    if (ciudad.present) {
      map['ciudad'] = Variable<String>(ciudad.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (modalidadAtencion.present) {
      map['modalidad_atencion'] = Variable<String>(modalidadAtencion.value);
    }
    if (estadoUbicacion.present) {
      map['estado_ubicacion'] = Variable<String>(estadoUbicacion.value);
    }
    if (urlFuente.present) {
      map['url_fuente'] = Variable<String>(urlFuente.value);
    }
    if (fechaVerificacion.present) {
      map['fecha_verificacion'] = Variable<DateTime>(fechaVerificacion.value);
    }
    if (activo.present) {
      map['activo'] = Variable<bool>(activo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationLocationsCompanion(')
          ..write('idUbicacion: $idUbicacion, ')
          ..write('identificador: $identificador, ')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('nombreSede: $nombreSede, ')
          ..write('ciudad: $ciudad, ')
          ..write('direccion: $direccion, ')
          ..write('telefono: $telefono, ')
          ..write('email: $email, ')
          ..write('modalidadAtencion: $modalidadAtencion, ')
          ..write('estadoUbicacion: $estadoUbicacion, ')
          ..write('urlFuente: $urlFuente, ')
          ..write('fechaVerificacion: $fechaVerificacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }
}

class $OfficialResourcesTable extends OfficialResources
    with TableInfo<$OfficialResourcesTable, OfficialResource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfficialResourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idRecursoMeta = const VerificationMeta(
    'idRecurso',
  );
  @override
  late final GeneratedColumn<int> idRecurso = GeneratedColumn<int>(
    'id_recurso',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _identificadorMeta = const VerificationMeta(
    'identificador',
  );
  @override
  late final GeneratedColumn<String> identificador = GeneratedColumn<String>(
    'identificador',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _idCategoriaMeta = const VerificationMeta(
    'idCategoria',
  );
  @override
  late final GeneratedColumn<int> idCategoria = GeneratedColumn<int>(
    'id_categoria',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id_categoria)',
    ),
  );
  static const VerificationMeta _idOrganizacionMeta = const VerificationMeta(
    'idOrganizacion',
  );
  @override
  late final GeneratedColumn<int> idOrganizacion = GeneratedColumn<int>(
    'id_organizacion',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES organizations (id_organizacion)',
    ),
  );
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlOficialMeta = const VerificationMeta(
    'urlOficial',
  );
  @override
  late final GeneratedColumn<String> urlOficial = GeneratedColumn<String>(
    'url_oficial',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaVerificacionMeta = const VerificationMeta(
    'fechaVerificacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaVerificacion =
      GeneratedColumn<DateTime>(
        'fecha_verificacion',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _activoMeta = const VerificationMeta('activo');
  @override
  late final GeneratedColumn<bool> activo = GeneratedColumn<bool>(
    'activo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("activo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idRecurso,
    identificador,
    idCategoria,
    idOrganizacion,
    titulo,
    descripcion,
    urlOficial,
    fechaVerificacion,
    activo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'official_resources';
  @override
  VerificationContext validateIntegrity(
    Insertable<OfficialResource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_recurso')) {
      context.handle(
        _idRecursoMeta,
        idRecurso.isAcceptableOrUnknown(data['id_recurso']!, _idRecursoMeta),
      );
    }
    if (data.containsKey('identificador')) {
      context.handle(
        _identificadorMeta,
        identificador.isAcceptableOrUnknown(
          data['identificador']!,
          _identificadorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_identificadorMeta);
    }
    if (data.containsKey('id_categoria')) {
      context.handle(
        _idCategoriaMeta,
        idCategoria.isAcceptableOrUnknown(
          data['id_categoria']!,
          _idCategoriaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idCategoriaMeta);
    }
    if (data.containsKey('id_organizacion')) {
      context.handle(
        _idOrganizacionMeta,
        idOrganizacion.isAcceptableOrUnknown(
          data['id_organizacion']!,
          _idOrganizacionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idOrganizacionMeta);
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _tituloMeta,
        titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta),
      );
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('url_oficial')) {
      context.handle(
        _urlOficialMeta,
        urlOficial.isAcceptableOrUnknown(data['url_oficial']!, _urlOficialMeta),
      );
    } else if (isInserting) {
      context.missing(_urlOficialMeta);
    }
    if (data.containsKey('fecha_verificacion')) {
      context.handle(
        _fechaVerificacionMeta,
        fechaVerificacion.isAcceptableOrUnknown(
          data['fecha_verificacion']!,
          _fechaVerificacionMeta,
        ),
      );
    }
    if (data.containsKey('activo')) {
      context.handle(
        _activoMeta,
        activo.isAcceptableOrUnknown(data['activo']!, _activoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idRecurso};
  @override
  OfficialResource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfficialResource(
      idRecurso: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_recurso'],
      )!,
      identificador: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identificador'],
      )!,
      idCategoria: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_categoria'],
      )!,
      idOrganizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_organizacion'],
      )!,
      titulo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      urlOficial: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url_oficial'],
      )!,
      fechaVerificacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_verificacion'],
      ),
      activo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}activo'],
      )!,
    );
  }

  @override
  $OfficialResourcesTable createAlias(String alias) {
    return $OfficialResourcesTable(attachedDatabase, alias);
  }
}

class OfficialResource extends DataClass
    implements Insertable<OfficialResource> {
  final int idRecurso;
  final String identificador;
  final int idCategoria;
  final int idOrganizacion;
  final String titulo;
  final String descripcion;
  final String urlOficial;
  final DateTime? fechaVerificacion;
  final bool activo;
  const OfficialResource({
    required this.idRecurso,
    required this.identificador,
    required this.idCategoria,
    required this.idOrganizacion,
    required this.titulo,
    required this.descripcion,
    required this.urlOficial,
    this.fechaVerificacion,
    required this.activo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_recurso'] = Variable<int>(idRecurso);
    map['identificador'] = Variable<String>(identificador);
    map['id_categoria'] = Variable<int>(idCategoria);
    map['id_organizacion'] = Variable<int>(idOrganizacion);
    map['titulo'] = Variable<String>(titulo);
    map['descripcion'] = Variable<String>(descripcion);
    map['url_oficial'] = Variable<String>(urlOficial);
    if (!nullToAbsent || fechaVerificacion != null) {
      map['fecha_verificacion'] = Variable<DateTime>(fechaVerificacion);
    }
    map['activo'] = Variable<bool>(activo);
    return map;
  }

  OfficialResourcesCompanion toCompanion(bool nullToAbsent) {
    return OfficialResourcesCompanion(
      idRecurso: Value(idRecurso),
      identificador: Value(identificador),
      idCategoria: Value(idCategoria),
      idOrganizacion: Value(idOrganizacion),
      titulo: Value(titulo),
      descripcion: Value(descripcion),
      urlOficial: Value(urlOficial),
      fechaVerificacion: fechaVerificacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaVerificacion),
      activo: Value(activo),
    );
  }

  factory OfficialResource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfficialResource(
      idRecurso: serializer.fromJson<int>(json['idRecurso']),
      identificador: serializer.fromJson<String>(json['identificador']),
      idCategoria: serializer.fromJson<int>(json['idCategoria']),
      idOrganizacion: serializer.fromJson<int>(json['idOrganizacion']),
      titulo: serializer.fromJson<String>(json['titulo']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      urlOficial: serializer.fromJson<String>(json['urlOficial']),
      fechaVerificacion: serializer.fromJson<DateTime?>(
        json['fechaVerificacion'],
      ),
      activo: serializer.fromJson<bool>(json['activo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idRecurso': serializer.toJson<int>(idRecurso),
      'identificador': serializer.toJson<String>(identificador),
      'idCategoria': serializer.toJson<int>(idCategoria),
      'idOrganizacion': serializer.toJson<int>(idOrganizacion),
      'titulo': serializer.toJson<String>(titulo),
      'descripcion': serializer.toJson<String>(descripcion),
      'urlOficial': serializer.toJson<String>(urlOficial),
      'fechaVerificacion': serializer.toJson<DateTime?>(fechaVerificacion),
      'activo': serializer.toJson<bool>(activo),
    };
  }

  OfficialResource copyWith({
    int? idRecurso,
    String? identificador,
    int? idCategoria,
    int? idOrganizacion,
    String? titulo,
    String? descripcion,
    String? urlOficial,
    Value<DateTime?> fechaVerificacion = const Value.absent(),
    bool? activo,
  }) => OfficialResource(
    idRecurso: idRecurso ?? this.idRecurso,
    identificador: identificador ?? this.identificador,
    idCategoria: idCategoria ?? this.idCategoria,
    idOrganizacion: idOrganizacion ?? this.idOrganizacion,
    titulo: titulo ?? this.titulo,
    descripcion: descripcion ?? this.descripcion,
    urlOficial: urlOficial ?? this.urlOficial,
    fechaVerificacion: fechaVerificacion.present
        ? fechaVerificacion.value
        : this.fechaVerificacion,
    activo: activo ?? this.activo,
  );
  OfficialResource copyWithCompanion(OfficialResourcesCompanion data) {
    return OfficialResource(
      idRecurso: data.idRecurso.present ? data.idRecurso.value : this.idRecurso,
      identificador: data.identificador.present
          ? data.identificador.value
          : this.identificador,
      idCategoria: data.idCategoria.present
          ? data.idCategoria.value
          : this.idCategoria,
      idOrganizacion: data.idOrganizacion.present
          ? data.idOrganizacion.value
          : this.idOrganizacion,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      urlOficial: data.urlOficial.present
          ? data.urlOficial.value
          : this.urlOficial,
      fechaVerificacion: data.fechaVerificacion.present
          ? data.fechaVerificacion.value
          : this.fechaVerificacion,
      activo: data.activo.present ? data.activo.value : this.activo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfficialResource(')
          ..write('idRecurso: $idRecurso, ')
          ..write('identificador: $identificador, ')
          ..write('idCategoria: $idCategoria, ')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('titulo: $titulo, ')
          ..write('descripcion: $descripcion, ')
          ..write('urlOficial: $urlOficial, ')
          ..write('fechaVerificacion: $fechaVerificacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idRecurso,
    identificador,
    idCategoria,
    idOrganizacion,
    titulo,
    descripcion,
    urlOficial,
    fechaVerificacion,
    activo,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfficialResource &&
          other.idRecurso == this.idRecurso &&
          other.identificador == this.identificador &&
          other.idCategoria == this.idCategoria &&
          other.idOrganizacion == this.idOrganizacion &&
          other.titulo == this.titulo &&
          other.descripcion == this.descripcion &&
          other.urlOficial == this.urlOficial &&
          other.fechaVerificacion == this.fechaVerificacion &&
          other.activo == this.activo);
}

class OfficialResourcesCompanion extends UpdateCompanion<OfficialResource> {
  final Value<int> idRecurso;
  final Value<String> identificador;
  final Value<int> idCategoria;
  final Value<int> idOrganizacion;
  final Value<String> titulo;
  final Value<String> descripcion;
  final Value<String> urlOficial;
  final Value<DateTime?> fechaVerificacion;
  final Value<bool> activo;
  const OfficialResourcesCompanion({
    this.idRecurso = const Value.absent(),
    this.identificador = const Value.absent(),
    this.idCategoria = const Value.absent(),
    this.idOrganizacion = const Value.absent(),
    this.titulo = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.urlOficial = const Value.absent(),
    this.fechaVerificacion = const Value.absent(),
    this.activo = const Value.absent(),
  });
  OfficialResourcesCompanion.insert({
    this.idRecurso = const Value.absent(),
    required String identificador,
    required int idCategoria,
    required int idOrganizacion,
    required String titulo,
    required String descripcion,
    required String urlOficial,
    this.fechaVerificacion = const Value.absent(),
    this.activo = const Value.absent(),
  }) : identificador = Value(identificador),
       idCategoria = Value(idCategoria),
       idOrganizacion = Value(idOrganizacion),
       titulo = Value(titulo),
       descripcion = Value(descripcion),
       urlOficial = Value(urlOficial);
  static Insertable<OfficialResource> custom({
    Expression<int>? idRecurso,
    Expression<String>? identificador,
    Expression<int>? idCategoria,
    Expression<int>? idOrganizacion,
    Expression<String>? titulo,
    Expression<String>? descripcion,
    Expression<String>? urlOficial,
    Expression<DateTime>? fechaVerificacion,
    Expression<bool>? activo,
  }) {
    return RawValuesInsertable({
      if (idRecurso != null) 'id_recurso': idRecurso,
      if (identificador != null) 'identificador': identificador,
      if (idCategoria != null) 'id_categoria': idCategoria,
      if (idOrganizacion != null) 'id_organizacion': idOrganizacion,
      if (titulo != null) 'titulo': titulo,
      if (descripcion != null) 'descripcion': descripcion,
      if (urlOficial != null) 'url_oficial': urlOficial,
      if (fechaVerificacion != null) 'fecha_verificacion': fechaVerificacion,
      if (activo != null) 'activo': activo,
    });
  }

  OfficialResourcesCompanion copyWith({
    Value<int>? idRecurso,
    Value<String>? identificador,
    Value<int>? idCategoria,
    Value<int>? idOrganizacion,
    Value<String>? titulo,
    Value<String>? descripcion,
    Value<String>? urlOficial,
    Value<DateTime?>? fechaVerificacion,
    Value<bool>? activo,
  }) {
    return OfficialResourcesCompanion(
      idRecurso: idRecurso ?? this.idRecurso,
      identificador: identificador ?? this.identificador,
      idCategoria: idCategoria ?? this.idCategoria,
      idOrganizacion: idOrganizacion ?? this.idOrganizacion,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      urlOficial: urlOficial ?? this.urlOficial,
      fechaVerificacion: fechaVerificacion ?? this.fechaVerificacion,
      activo: activo ?? this.activo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idRecurso.present) {
      map['id_recurso'] = Variable<int>(idRecurso.value);
    }
    if (identificador.present) {
      map['identificador'] = Variable<String>(identificador.value);
    }
    if (idCategoria.present) {
      map['id_categoria'] = Variable<int>(idCategoria.value);
    }
    if (idOrganizacion.present) {
      map['id_organizacion'] = Variable<int>(idOrganizacion.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (urlOficial.present) {
      map['url_oficial'] = Variable<String>(urlOficial.value);
    }
    if (fechaVerificacion.present) {
      map['fecha_verificacion'] = Variable<DateTime>(fechaVerificacion.value);
    }
    if (activo.present) {
      map['activo'] = Variable<bool>(activo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfficialResourcesCompanion(')
          ..write('idRecurso: $idRecurso, ')
          ..write('identificador: $identificador, ')
          ..write('idCategoria: $idCategoria, ')
          ..write('idOrganizacion: $idOrganizacion, ')
          ..write('titulo: $titulo, ')
          ..write('descripcion: $descripcion, ')
          ..write('urlOficial: $urlOficial, ')
          ..write('fechaVerificacion: $fechaVerificacion, ')
          ..write('activo: $activo')
          ..write(')'))
        .toString();
  }
}

class $PreferencesTable extends Preferences
    with TableInfo<$PreferencesTable, Preference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPreferenciaMeta = const VerificationMeta(
    'idPreferencia',
  );
  @override
  late final GeneratedColumn<int> idPreferencia = GeneratedColumn<int>(
    'id_preferencia',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idiomaInterfazMeta = const VerificationMeta(
    'idiomaInterfaz',
  );
  @override
  late final GeneratedColumn<String> idiomaInterfaz = GeneratedColumn<String>(
    'idioma_interfaz',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('es'),
  );
  static const VerificationMeta _tamanoFuenteMeta = const VerificationMeta(
    'tamanoFuente',
  );
  @override
  late final GeneratedColumn<int> tamanoFuente = GeneratedColumn<int>(
    'tamano_fuente',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(16),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPreferencia,
    idiomaInterfaz,
    tamanoFuente,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preferences';
  @override
  VerificationContext validateIntegrity(
    Insertable<Preference> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_preferencia')) {
      context.handle(
        _idPreferenciaMeta,
        idPreferencia.isAcceptableOrUnknown(
          data['id_preferencia']!,
          _idPreferenciaMeta,
        ),
      );
    }
    if (data.containsKey('idioma_interfaz')) {
      context.handle(
        _idiomaInterfazMeta,
        idiomaInterfaz.isAcceptableOrUnknown(
          data['idioma_interfaz']!,
          _idiomaInterfazMeta,
        ),
      );
    }
    if (data.containsKey('tamano_fuente')) {
      context.handle(
        _tamanoFuenteMeta,
        tamanoFuente.isAcceptableOrUnknown(
          data['tamano_fuente']!,
          _tamanoFuenteMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPreferencia};
  @override
  Preference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Preference(
      idPreferencia: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_preferencia'],
      )!,
      idiomaInterfaz: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idioma_interfaz'],
      )!,
      tamanoFuente: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tamano_fuente'],
      )!,
    );
  }

  @override
  $PreferencesTable createAlias(String alias) {
    return $PreferencesTable(attachedDatabase, alias);
  }
}

class Preference extends DataClass implements Insertable<Preference> {
  final int idPreferencia;
  final String idiomaInterfaz;
  final int tamanoFuente;
  const Preference({
    required this.idPreferencia,
    required this.idiomaInterfaz,
    required this.tamanoFuente,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_preferencia'] = Variable<int>(idPreferencia);
    map['idioma_interfaz'] = Variable<String>(idiomaInterfaz);
    map['tamano_fuente'] = Variable<int>(tamanoFuente);
    return map;
  }

  PreferencesCompanion toCompanion(bool nullToAbsent) {
    return PreferencesCompanion(
      idPreferencia: Value(idPreferencia),
      idiomaInterfaz: Value(idiomaInterfaz),
      tamanoFuente: Value(tamanoFuente),
    );
  }

  factory Preference.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preference(
      idPreferencia: serializer.fromJson<int>(json['idPreferencia']),
      idiomaInterfaz: serializer.fromJson<String>(json['idiomaInterfaz']),
      tamanoFuente: serializer.fromJson<int>(json['tamanoFuente']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPreferencia': serializer.toJson<int>(idPreferencia),
      'idiomaInterfaz': serializer.toJson<String>(idiomaInterfaz),
      'tamanoFuente': serializer.toJson<int>(tamanoFuente),
    };
  }

  Preference copyWith({
    int? idPreferencia,
    String? idiomaInterfaz,
    int? tamanoFuente,
  }) => Preference(
    idPreferencia: idPreferencia ?? this.idPreferencia,
    idiomaInterfaz: idiomaInterfaz ?? this.idiomaInterfaz,
    tamanoFuente: tamanoFuente ?? this.tamanoFuente,
  );
  Preference copyWithCompanion(PreferencesCompanion data) {
    return Preference(
      idPreferencia: data.idPreferencia.present
          ? data.idPreferencia.value
          : this.idPreferencia,
      idiomaInterfaz: data.idiomaInterfaz.present
          ? data.idiomaInterfaz.value
          : this.idiomaInterfaz,
      tamanoFuente: data.tamanoFuente.present
          ? data.tamanoFuente.value
          : this.tamanoFuente,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Preference(')
          ..write('idPreferencia: $idPreferencia, ')
          ..write('idiomaInterfaz: $idiomaInterfaz, ')
          ..write('tamanoFuente: $tamanoFuente')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPreferencia, idiomaInterfaz, tamanoFuente);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preference &&
          other.idPreferencia == this.idPreferencia &&
          other.idiomaInterfaz == this.idiomaInterfaz &&
          other.tamanoFuente == this.tamanoFuente);
}

class PreferencesCompanion extends UpdateCompanion<Preference> {
  final Value<int> idPreferencia;
  final Value<String> idiomaInterfaz;
  final Value<int> tamanoFuente;
  const PreferencesCompanion({
    this.idPreferencia = const Value.absent(),
    this.idiomaInterfaz = const Value.absent(),
    this.tamanoFuente = const Value.absent(),
  });
  PreferencesCompanion.insert({
    this.idPreferencia = const Value.absent(),
    this.idiomaInterfaz = const Value.absent(),
    this.tamanoFuente = const Value.absent(),
  });
  static Insertable<Preference> custom({
    Expression<int>? idPreferencia,
    Expression<String>? idiomaInterfaz,
    Expression<int>? tamanoFuente,
  }) {
    return RawValuesInsertable({
      if (idPreferencia != null) 'id_preferencia': idPreferencia,
      if (idiomaInterfaz != null) 'idioma_interfaz': idiomaInterfaz,
      if (tamanoFuente != null) 'tamano_fuente': tamanoFuente,
    });
  }

  PreferencesCompanion copyWith({
    Value<int>? idPreferencia,
    Value<String>? idiomaInterfaz,
    Value<int>? tamanoFuente,
  }) {
    return PreferencesCompanion(
      idPreferencia: idPreferencia ?? this.idPreferencia,
      idiomaInterfaz: idiomaInterfaz ?? this.idiomaInterfaz,
      tamanoFuente: tamanoFuente ?? this.tamanoFuente,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPreferencia.present) {
      map['id_preferencia'] = Variable<int>(idPreferencia.value);
    }
    if (idiomaInterfaz.present) {
      map['idioma_interfaz'] = Variable<String>(idiomaInterfaz.value);
    }
    if (tamanoFuente.present) {
      map['tamano_fuente'] = Variable<int>(tamanoFuente.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferencesCompanion(')
          ..write('idPreferencia: $idPreferencia, ')
          ..write('idiomaInterfaz: $idiomaInterfaz, ')
          ..write('tamanoFuente: $tamanoFuente')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $OrganizationsTable organizations = $OrganizationsTable(this);
  late final $OrganizationLocationsTable organizationLocations =
      $OrganizationLocationsTable(this);
  late final $OfficialResourcesTable officialResources =
      $OfficialResourcesTable(this);
  late final $PreferencesTable preferences = $PreferencesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categories,
    organizations,
    organizationLocations,
    officialResources,
    preferences,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'organizations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('organization_locations', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({
  Value<int> idCategoria,
  required String nombre,
  required String descripcion,
  Value<bool> activo,
});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> idCategoria,
  Value<String> nombre,
  Value<String> descripcion,
  Value<bool> activo,
});

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OfficialResourcesTable, List<OfficialResource>>
  _officialResourcesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.officialResources,
        aliasName: 'categories__id_categoria__official_resources__id_categoria',
      );

  $$OfficialResourcesTableProcessedTableManager get officialResourcesRefs {
    final manager =
        $$OfficialResourcesTableTableManager(
          $_db,
          $_db.officialResources,
        ).filter(
          (f) => f.idCategoria.idCategoria.sqlEquals(
            $_itemColumn<int>('id_categoria')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _officialResourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idCategoria => $composableBuilder(
    column: $table.idCategoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> officialResourcesRefs(
    Expression<bool> Function($$OfficialResourcesTableFilterComposer f) f,
  ) {
    final $$OfficialResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.officialResources,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfficialResourcesTableFilterComposer(
            $db: $db,
            $table: $db.officialResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idCategoria => $composableBuilder(
    column: $table.idCategoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idCategoria => $composableBuilder(
    column: $table.idCategoria,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get activo =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  Expression<T> officialResourcesRefs<T extends Object>(
    Expression<T> Function($$OfficialResourcesTableAnnotationComposer a) f,
  ) {
    final $$OfficialResourcesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idCategoria,
          referencedTable: $db.officialResources,
          getReferencedColumn: (t) => t.idCategoria,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OfficialResourcesTableAnnotationComposer(
                $db: $db,
                $table: $db.officialResources,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool officialResourcesRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idCategoria = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => CategoriesCompanion(
                idCategoria: idCategoria,
                nombre: nombre,
                descripcion: descripcion,
                activo: activo,
              ),
          createCompanionCallback:
              ({
                Value<int> idCategoria = const Value.absent(),
                required String nombre,
                required String descripcion,
                Value<bool> activo = const Value.absent(),
              }) => CategoriesCompanion.insert(
                idCategoria: idCategoria,
                nombre: nombre,
                descripcion: descripcion,
                activo: activo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CategoriesTable, Category>(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({officialResourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (officialResourcesRefs) db.officialResources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (officialResourcesRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      OfficialResource
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._officialResourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).officialResourcesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.idCategoria == item.idCategoria,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool officialResourcesRefs})
    >;
typedef $$OrganizationsTableCreateCompanionBuilder =
    OrganizationsCompanion Function({
      Value<int> idOrganizacion,
      required String identificador,
      required String nombre,
      required String tipoOrganizacion,
      required String descripcion,
      Value<String?> ciudad,
      Value<String?> direccion,
      Value<String?> telefono,
      Value<String?> email,
      Value<String?> urlOficial,
      Value<String> modalidadAtencion,
      Value<String> estadoUbicacion,
      Value<bool> activo,
    });
typedef $$OrganizationsTableUpdateCompanionBuilder =
    OrganizationsCompanion Function({
      Value<int> idOrganizacion,
      Value<String> identificador,
      Value<String> nombre,
      Value<String> tipoOrganizacion,
      Value<String> descripcion,
      Value<String?> ciudad,
      Value<String?> direccion,
      Value<String?> telefono,
      Value<String?> email,
      Value<String?> urlOficial,
      Value<String> modalidadAtencion,
      Value<String> estadoUbicacion,
      Value<bool> activo,
    });

final class $$OrganizationsTableReferences
    extends BaseReferences<_$AppDatabase, $OrganizationsTable, Organization> {
  $$OrganizationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $OrganizationLocationsTable,
    List<OrganizationLocation>
  >
  _organizationLocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.organizationLocations,
        aliasName: 'organizations__id_organizacion__organization_locations__id_organizacion',
      );

  $$OrganizationLocationsTableProcessedTableManager
  get organizationLocationsRefs {
    final manager =
        $$OrganizationLocationsTableTableManager(
          $_db,
          $_db.organizationLocations,
        ).filter(
          (f) => f.idOrganizacion.idOrganizacion.sqlEquals(
            $_itemColumn<int>('id_organizacion')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _organizationLocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OfficialResourcesTable, List<OfficialResource>>
  _officialResourcesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.officialResources,
    aliasName:
        'organizations__id_organizacion__official_resources__id_organizacion',
  );

  $$OfficialResourcesTableProcessedTableManager get officialResourcesRefs {
    final manager =
        $$OfficialResourcesTableTableManager(
          $_db,
          $_db.officialResources,
        ).filter(
          (f) => f.idOrganizacion.idOrganizacion.sqlEquals(
            $_itemColumn<int>('id_organizacion')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _officialResourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrganizationsTableFilterComposer
    extends Composer<_$AppDatabase, $OrganizationsTable> {
  $$OrganizationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOrganizacion => $composableBuilder(
    column: $table.idOrganizacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoOrganizacion => $composableBuilder(
    column: $table.tipoOrganizacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ciudad => $composableBuilder(
    column: $table.ciudad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> organizationLocationsRefs(
    Expression<bool> Function($$OrganizationLocationsTableFilterComposer f) f,
  ) {
    final $$OrganizationLocationsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idOrganizacion,
          referencedTable: $db.organizationLocations,
          getReferencedColumn: (t) => t.idOrganizacion,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OrganizationLocationsTableFilterComposer(
                $db: $db,
                $table: $db.organizationLocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> officialResourcesRefs(
    Expression<bool> Function($$OfficialResourcesTableFilterComposer f) f,
  ) {
    final $$OfficialResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.officialResources,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OfficialResourcesTableFilterComposer(
            $db: $db,
            $table: $db.officialResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrganizationsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganizationsTable> {
  $$OrganizationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOrganizacion => $composableBuilder(
    column: $table.idOrganizacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoOrganizacion => $composableBuilder(
    column: $table.tipoOrganizacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ciudad => $composableBuilder(
    column: $table.ciudad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganizationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganizationsTable> {
  $$OrganizationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOrganizacion => $composableBuilder(
    column: $table.idOrganizacion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get tipoOrganizacion => $composableBuilder(
    column: $table.tipoOrganizacion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ciudad =>
      $composableBuilder(column: $table.ciudad, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get activo =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  Expression<T> organizationLocationsRefs<T extends Object>(
    Expression<T> Function($$OrganizationLocationsTableAnnotationComposer a) f,
  ) {
    final $$OrganizationLocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idOrganizacion,
          referencedTable: $db.organizationLocations,
          getReferencedColumn: (t) => t.idOrganizacion,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OrganizationLocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.organizationLocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> officialResourcesRefs<T extends Object>(
    Expression<T> Function($$OfficialResourcesTableAnnotationComposer a) f,
  ) {
    final $$OfficialResourcesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idOrganizacion,
          referencedTable: $db.officialResources,
          getReferencedColumn: (t) => t.idOrganizacion,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$OfficialResourcesTableAnnotationComposer(
                $db: $db,
                $table: $db.officialResources,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$OrganizationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganizationsTable,
          Organization,
          $$OrganizationsTableFilterComposer,
          $$OrganizationsTableOrderingComposer,
          $$OrganizationsTableAnnotationComposer,
          $$OrganizationsTableCreateCompanionBuilder,
          $$OrganizationsTableUpdateCompanionBuilder,
          (Organization, $$OrganizationsTableReferences),
          Organization,
          PrefetchHooks Function({
            bool organizationLocationsRefs,
            bool officialResourcesRefs,
          })
        > {
  $$OrganizationsTableTableManager(_$AppDatabase db, $OrganizationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrganizationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrganizationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOrganizacion = const Value.absent(),
                Value<String> identificador = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> tipoOrganizacion = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String?> ciudad = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> urlOficial = const Value.absent(),
                Value<String> modalidadAtencion = const Value.absent(),
                Value<String> estadoUbicacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OrganizationsCompanion(
                idOrganizacion: idOrganizacion,
                identificador: identificador,
                nombre: nombre,
                tipoOrganizacion: tipoOrganizacion,
                descripcion: descripcion,
                ciudad: ciudad,
                direccion: direccion,
                telefono: telefono,
                email: email,
                urlOficial: urlOficial,
                modalidadAtencion: modalidadAtencion,
                estadoUbicacion: estadoUbicacion,
                activo: activo,
              ),
          createCompanionCallback:
              ({
                Value<int> idOrganizacion = const Value.absent(),
                required String identificador,
                required String nombre,
                required String tipoOrganizacion,
                required String descripcion,
                Value<String?> ciudad = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> urlOficial = const Value.absent(),
                Value<String> modalidadAtencion = const Value.absent(),
                Value<String> estadoUbicacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OrganizationsCompanion.insert(
                idOrganizacion: idOrganizacion,
                identificador: identificador,
                nombre: nombre,
                tipoOrganizacion: tipoOrganizacion,
                descripcion: descripcion,
                ciudad: ciudad,
                direccion: direccion,
                telefono: telefono,
                email: email,
                urlOficial: urlOficial,
                modalidadAtencion: modalidadAtencion,
                estadoUbicacion: estadoUbicacion,
                activo: activo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OrganizationsTable, Organization>(table),
                  $$OrganizationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                organizationLocationsRefs = false,
                officialResourcesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (organizationLocationsRefs) db.organizationLocations,
                    if (officialResourcesRefs) db.officialResources,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (organizationLocationsRefs)
                        await $_getPrefetchedData<
                          Organization,
                          $OrganizationsTable,
                          OrganizationLocation
                        >(
                          currentTable: table,
                          referencedTable: $$OrganizationsTableReferences
                              ._organizationLocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrganizationsTableReferences(
                                db,
                                table,
                                p0,
                              ).organizationLocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrganizacion == item.idOrganizacion,
                              ),
                          typedResults: items,
                        ),
                      if (officialResourcesRefs)
                        await $_getPrefetchedData<
                          Organization,
                          $OrganizationsTable,
                          OfficialResource
                        >(
                          currentTable: table,
                          referencedTable: $$OrganizationsTableReferences
                              ._officialResourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrganizationsTableReferences(
                                db,
                                table,
                                p0,
                              ).officialResourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.idOrganizacion == item.idOrganizacion,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrganizationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganizationsTable,
      Organization,
      $$OrganizationsTableFilterComposer,
      $$OrganizationsTableOrderingComposer,
      $$OrganizationsTableAnnotationComposer,
      $$OrganizationsTableCreateCompanionBuilder,
      $$OrganizationsTableUpdateCompanionBuilder,
      (Organization, $$OrganizationsTableReferences),
      Organization,
      PrefetchHooks Function({
        bool organizationLocationsRefs,
        bool officialResourcesRefs,
      })
    >;
typedef $$OrganizationLocationsTableCreateCompanionBuilder =
    OrganizationLocationsCompanion Function({
      Value<int> idUbicacion,
      Value<String?> identificador,
      required int idOrganizacion,
      Value<String?> nombreSede,
      Value<String?> ciudad,
      Value<String?> direccion,
      Value<String?> telefono,
      Value<String?> email,
      Value<String> modalidadAtencion,
      Value<String> estadoUbicacion,
      Value<String?> urlFuente,
      Value<DateTime?> fechaVerificacion,
      Value<bool> activo,
    });
typedef $$OrganizationLocationsTableUpdateCompanionBuilder =
    OrganizationLocationsCompanion Function({
      Value<int> idUbicacion,
      Value<String?> identificador,
      Value<int> idOrganizacion,
      Value<String?> nombreSede,
      Value<String?> ciudad,
      Value<String?> direccion,
      Value<String?> telefono,
      Value<String?> email,
      Value<String> modalidadAtencion,
      Value<String> estadoUbicacion,
      Value<String?> urlFuente,
      Value<DateTime?> fechaVerificacion,
      Value<bool> activo,
    });

final class $$OrganizationLocationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OrganizationLocationsTable,
          OrganizationLocation
        > {
  $$OrganizationLocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrganizationsTable _idOrganizacionTable(
    _$AppDatabase db,
  ) => db.organizations.createAlias(
    'organization_locations__id_organizacion__organizations__id_organizacion',
  );

  $$OrganizationsTableProcessedTableManager get idOrganizacion {
    final $_column = $_itemColumn<int>('id_organizacion')!;

    final manager = $$OrganizationsTableTableManager(
      $_db,
      $_db.organizations,
    ).filter((f) => f.idOrganizacion.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrganizacionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrganizationLocationsTableFilterComposer
    extends Composer<_$AppDatabase, $OrganizationLocationsTable> {
  $$OrganizationLocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idUbicacion => $composableBuilder(
    column: $table.idUbicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombreSede => $composableBuilder(
    column: $table.nombreSede,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ciudad => $composableBuilder(
    column: $table.ciudad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlFuente => $composableBuilder(
    column: $table.urlFuente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  $$OrganizationsTableFilterComposer get idOrganizacion {
    final $$OrganizationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableFilterComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrganizationLocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrganizationLocationsTable> {
  $$OrganizationLocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idUbicacion => $composableBuilder(
    column: $table.idUbicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombreSede => $composableBuilder(
    column: $table.nombreSede,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ciudad => $composableBuilder(
    column: $table.ciudad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccion => $composableBuilder(
    column: $table.direccion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlFuente => $composableBuilder(
    column: $table.urlFuente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrganizationsTableOrderingComposer get idOrganizacion {
    final $$OrganizationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableOrderingComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrganizationLocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrganizationLocationsTable> {
  $$OrganizationLocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idUbicacion => $composableBuilder(
    column: $table.idUbicacion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nombreSede => $composableBuilder(
    column: $table.nombreSede,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ciudad =>
      $composableBuilder(column: $table.ciudad, builder: (column) => column);

  GeneratedColumn<String> get direccion =>
      $composableBuilder(column: $table.direccion, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get modalidadAtencion => $composableBuilder(
    column: $table.modalidadAtencion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get estadoUbicacion => $composableBuilder(
    column: $table.estadoUbicacion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlFuente =>
      $composableBuilder(column: $table.urlFuente, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get activo =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  $$OrganizationsTableAnnotationComposer get idOrganizacion {
    final $$OrganizationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableAnnotationComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrganizationLocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrganizationLocationsTable,
          OrganizationLocation,
          $$OrganizationLocationsTableFilterComposer,
          $$OrganizationLocationsTableOrderingComposer,
          $$OrganizationLocationsTableAnnotationComposer,
          $$OrganizationLocationsTableCreateCompanionBuilder,
          $$OrganizationLocationsTableUpdateCompanionBuilder,
          (OrganizationLocation, $$OrganizationLocationsTableReferences),
          OrganizationLocation,
          PrefetchHooks Function({bool idOrganizacion})
        > {
  $$OrganizationLocationsTableTableManager(
    _$AppDatabase db,
    $OrganizationLocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationLocationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$OrganizationLocationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$OrganizationLocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idUbicacion = const Value.absent(),
                Value<String?> identificador = const Value.absent(),
                Value<int> idOrganizacion = const Value.absent(),
                Value<String?> nombreSede = const Value.absent(),
                Value<String?> ciudad = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> modalidadAtencion = const Value.absent(),
                Value<String> estadoUbicacion = const Value.absent(),
                Value<String?> urlFuente = const Value.absent(),
                Value<DateTime?> fechaVerificacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OrganizationLocationsCompanion(
                idUbicacion: idUbicacion,
                identificador: identificador,
                idOrganizacion: idOrganizacion,
                nombreSede: nombreSede,
                ciudad: ciudad,
                direccion: direccion,
                telefono: telefono,
                email: email,
                modalidadAtencion: modalidadAtencion,
                estadoUbicacion: estadoUbicacion,
                urlFuente: urlFuente,
                fechaVerificacion: fechaVerificacion,
                activo: activo,
              ),
          createCompanionCallback:
              ({
                Value<int> idUbicacion = const Value.absent(),
                Value<String?> identificador = const Value.absent(),
                required int idOrganizacion,
                Value<String?> nombreSede = const Value.absent(),
                Value<String?> ciudad = const Value.absent(),
                Value<String?> direccion = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String> modalidadAtencion = const Value.absent(),
                Value<String> estadoUbicacion = const Value.absent(),
                Value<String?> urlFuente = const Value.absent(),
                Value<DateTime?> fechaVerificacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OrganizationLocationsCompanion.insert(
                idUbicacion: idUbicacion,
                identificador: identificador,
                idOrganizacion: idOrganizacion,
                nombreSede: nombreSede,
                ciudad: ciudad,
                direccion: direccion,
                telefono: telefono,
                email: email,
                modalidadAtencion: modalidadAtencion,
                estadoUbicacion: estadoUbicacion,
                urlFuente: urlFuente,
                fechaVerificacion: fechaVerificacion,
                activo: activo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $OrganizationLocationsTable,
                    OrganizationLocation
                  >(table),
                  $$OrganizationLocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idOrganizacion = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idOrganizacion) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idOrganizacion,
                        referencedTable: $$OrganizationLocationsTableReferences
                            ._idOrganizacionTable(db),
                        referencedColumn: $$OrganizationLocationsTableReferences
                            ._idOrganizacionTable(db)
                            .idOrganizacion,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrganizationLocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrganizationLocationsTable,
      OrganizationLocation,
      $$OrganizationLocationsTableFilterComposer,
      $$OrganizationLocationsTableOrderingComposer,
      $$OrganizationLocationsTableAnnotationComposer,
      $$OrganizationLocationsTableCreateCompanionBuilder,
      $$OrganizationLocationsTableUpdateCompanionBuilder,
      (OrganizationLocation, $$OrganizationLocationsTableReferences),
      OrganizationLocation,
      PrefetchHooks Function({bool idOrganizacion})
    >;
typedef $$OfficialResourcesTableCreateCompanionBuilder =
    OfficialResourcesCompanion Function({
      Value<int> idRecurso,
      required String identificador,
      required int idCategoria,
      required int idOrganizacion,
      required String titulo,
      required String descripcion,
      required String urlOficial,
      Value<DateTime?> fechaVerificacion,
      Value<bool> activo,
    });
typedef $$OfficialResourcesTableUpdateCompanionBuilder =
    OfficialResourcesCompanion Function({
      Value<int> idRecurso,
      Value<String> identificador,
      Value<int> idCategoria,
      Value<int> idOrganizacion,
      Value<String> titulo,
      Value<String> descripcion,
      Value<String> urlOficial,
      Value<DateTime?> fechaVerificacion,
      Value<bool> activo,
    });

final class $$OfficialResourcesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $OfficialResourcesTable,
          OfficialResource
        > {
  $$OfficialResourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CategoriesTable _idCategoriaTable(_$AppDatabase db) =>
      db.categories.createAlias(
        'official_resources__id_categoria__categories__id_categoria',
      );

  $$CategoriesTableProcessedTableManager get idCategoria {
    final $_column = $_itemColumn<int>('id_categoria')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.idCategoria.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idCategoriaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $OrganizationsTable _idOrganizacionTable(_$AppDatabase db) =>
      db.organizations.createAlias(
        'official_resources__id_organizacion__organizations__id_organizacion',
      );

  $$OrganizationsTableProcessedTableManager get idOrganizacion {
    final $_column = $_itemColumn<int>('id_organizacion')!;

    final manager = $$OrganizationsTableTableManager(
      $_db,
      $_db.organizations,
    ).filter((f) => f.idOrganizacion.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrganizacionTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OfficialResourcesTableFilterComposer
    extends Composer<_$AppDatabase, $OfficialResourcesTable> {
  $$OfficialResourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idRecurso => $composableBuilder(
    column: $table.idRecurso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnFilters(column),
  );

  $$CategoriesTableFilterComposer get idCategoria {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationsTableFilterComposer get idOrganizacion {
    final $$OrganizationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableFilterComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OfficialResourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $OfficialResourcesTable> {
  $$OfficialResourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idRecurso => $composableBuilder(
    column: $table.idRecurso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get activo => $composableBuilder(
    column: $table.activo,
    builder: (column) => ColumnOrderings(column),
  );

  $$CategoriesTableOrderingComposer get idCategoria {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationsTableOrderingComposer get idOrganizacion {
    final $$OrganizationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableOrderingComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OfficialResourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfficialResourcesTable> {
  $$OfficialResourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idRecurso =>
      $composableBuilder(column: $table.idRecurso, builder: (column) => column);

  GeneratedColumn<String> get identificador => $composableBuilder(
    column: $table.identificador,
    builder: (column) => column,
  );

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get urlOficial => $composableBuilder(
    column: $table.urlOficial,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaVerificacion => $composableBuilder(
    column: $table.fechaVerificacion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get activo =>
      $composableBuilder(column: $table.activo, builder: (column) => column);

  $$CategoriesTableAnnotationComposer get idCategoria {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idCategoria,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.idCategoria,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$OrganizationsTableAnnotationComposer get idOrganizacion {
    final $$OrganizationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrganizacion,
      referencedTable: $db.organizations,
      getReferencedColumn: (t) => t.idOrganizacion,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrganizationsTableAnnotationComposer(
            $db: $db,
            $table: $db.organizations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OfficialResourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OfficialResourcesTable,
          OfficialResource,
          $$OfficialResourcesTableFilterComposer,
          $$OfficialResourcesTableOrderingComposer,
          $$OfficialResourcesTableAnnotationComposer,
          $$OfficialResourcesTableCreateCompanionBuilder,
          $$OfficialResourcesTableUpdateCompanionBuilder,
          (OfficialResource, $$OfficialResourcesTableReferences),
          OfficialResource,
          PrefetchHooks Function({bool idCategoria, bool idOrganizacion})
        > {
  $$OfficialResourcesTableTableManager(
    _$AppDatabase db,
    $OfficialResourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfficialResourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfficialResourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfficialResourcesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idRecurso = const Value.absent(),
                Value<String> identificador = const Value.absent(),
                Value<int> idCategoria = const Value.absent(),
                Value<int> idOrganizacion = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> urlOficial = const Value.absent(),
                Value<DateTime?> fechaVerificacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OfficialResourcesCompanion(
                idRecurso: idRecurso,
                identificador: identificador,
                idCategoria: idCategoria,
                idOrganizacion: idOrganizacion,
                titulo: titulo,
                descripcion: descripcion,
                urlOficial: urlOficial,
                fechaVerificacion: fechaVerificacion,
                activo: activo,
              ),
          createCompanionCallback:
              ({
                Value<int> idRecurso = const Value.absent(),
                required String identificador,
                required int idCategoria,
                required int idOrganizacion,
                required String titulo,
                required String descripcion,
                required String urlOficial,
                Value<DateTime?> fechaVerificacion = const Value.absent(),
                Value<bool> activo = const Value.absent(),
              }) => OfficialResourcesCompanion.insert(
                idRecurso: idRecurso,
                identificador: identificador,
                idCategoria: idCategoria,
                idOrganizacion: idOrganizacion,
                titulo: titulo,
                descripcion: descripcion,
                urlOficial: urlOficial,
                fechaVerificacion: fechaVerificacion,
                activo: activo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OfficialResourcesTable, OfficialResource>(table),
                  $$OfficialResourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idCategoria = false, idOrganizacion = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idCategoria) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idCategoria,
                            referencedTable: $$OfficialResourcesTableReferences
                                ._idCategoriaTable(db),
                            referencedColumn: $$OfficialResourcesTableReferences
                                ._idCategoriaTable(db)
                                .idCategoria,
                          ) as T;
                        }
                        if (idOrganizacion) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.idOrganizacion,
                            referencedTable: $$OfficialResourcesTableReferences
                                ._idOrganizacionTable(db),
                            referencedColumn: $$OfficialResourcesTableReferences
                                ._idOrganizacionTable(db)
                                .idOrganizacion,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$OfficialResourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OfficialResourcesTable,
      OfficialResource,
      $$OfficialResourcesTableFilterComposer,
      $$OfficialResourcesTableOrderingComposer,
      $$OfficialResourcesTableAnnotationComposer,
      $$OfficialResourcesTableCreateCompanionBuilder,
      $$OfficialResourcesTableUpdateCompanionBuilder,
      (OfficialResource, $$OfficialResourcesTableReferences),
      OfficialResource,
      PrefetchHooks Function({bool idCategoria, bool idOrganizacion})
    >;
typedef $$PreferencesTableCreateCompanionBuilder =
    PreferencesCompanion Function({
      Value<int> idPreferencia,
      Value<String> idiomaInterfaz,
      Value<int> tamanoFuente,
    });
typedef $$PreferencesTableUpdateCompanionBuilder =
    PreferencesCompanion Function({
      Value<int> idPreferencia,
      Value<String> idiomaInterfaz,
      Value<int> tamanoFuente,
    });

class $$PreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPreferencia => $composableBuilder(
    column: $table.idPreferencia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idiomaInterfaz => $composableBuilder(
    column: $table.idiomaInterfaz,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tamanoFuente => $composableBuilder(
    column: $table.tamanoFuente,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPreferencia => $composableBuilder(
    column: $table.idPreferencia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idiomaInterfaz => $composableBuilder(
    column: $table.idiomaInterfaz,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tamanoFuente => $composableBuilder(
    column: $table.tamanoFuente,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferencesTable> {
  $$PreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPreferencia => $composableBuilder(
    column: $table.idPreferencia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idiomaInterfaz => $composableBuilder(
    column: $table.idiomaInterfaz,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tamanoFuente => $composableBuilder(
    column: $table.tamanoFuente,
    builder: (column) => column,
  );
}

class $$PreferencesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferencesTable,
          Preference,
          $$PreferencesTableFilterComposer,
          $$PreferencesTableOrderingComposer,
          $$PreferencesTableAnnotationComposer,
          $$PreferencesTableCreateCompanionBuilder,
          $$PreferencesTableUpdateCompanionBuilder,
          (
            Preference,
            BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
          ),
          Preference,
          PrefetchHooks Function()
        > {
  $$PreferencesTableTableManager(_$AppDatabase db, $PreferencesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPreferencia = const Value.absent(),
                Value<String> idiomaInterfaz = const Value.absent(),
                Value<int> tamanoFuente = const Value.absent(),
              }) => PreferencesCompanion(
                idPreferencia: idPreferencia,
                idiomaInterfaz: idiomaInterfaz,
                tamanoFuente: tamanoFuente,
              ),
          createCompanionCallback:
              ({
                Value<int> idPreferencia = const Value.absent(),
                Value<String> idiomaInterfaz = const Value.absent(),
                Value<int> tamanoFuente = const Value.absent(),
              }) => PreferencesCompanion.insert(
                idPreferencia: idPreferencia,
                idiomaInterfaz: idiomaInterfaz,
                tamanoFuente: tamanoFuente,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PreferencesTable, Preference>(table),
                  BaseReferences<_$AppDatabase, $PreferencesTable, Preference>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferencesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferencesTable,
      Preference,
      $$PreferencesTableFilterComposer,
      $$PreferencesTableOrderingComposer,
      $$PreferencesTableAnnotationComposer,
      $$PreferencesTableCreateCompanionBuilder,
      $$PreferencesTableUpdateCompanionBuilder,
      (
        Preference,
        BaseReferences<_$AppDatabase, $PreferencesTable, Preference>,
      ),
      Preference,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$OrganizationsTableTableManager get organizations =>
      $$OrganizationsTableTableManager(_db, _db.organizations);
  $$OrganizationLocationsTableTableManager get organizationLocations =>
      $$OrganizationLocationsTableTableManager(_db, _db.organizationLocations);
  $$OfficialResourcesTableTableManager get officialResources =>
      $$OfficialResourcesTableTableManager(_db, _db.officialResources);
  $$PreferencesTableTableManager get preferences =>
      $$PreferencesTableTableManager(_db, _db.preferences);
}
