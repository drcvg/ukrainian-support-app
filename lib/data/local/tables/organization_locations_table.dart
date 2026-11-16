import 'package:drift/drift.dart';

import 'organizations_table.dart';

class OrganizationLocations extends Table {
  IntColumn get idUbicacion => integer().autoIncrement()();

  TextColumn get identificador => text().nullable()();
  IntColumn get idOrganizacion => integer().references(
    Organizations,
    #idOrganizacion,
    onDelete: KeyAction.cascade,
  )();

  TextColumn get nombreSede => text().nullable()();

  TextColumn get ciudad => text().nullable()();

  TextColumn get direccion => text().nullable()();

  TextColumn get telefono => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get modalidadAtencion =>
      text().withDefault(const Constant('no_confirmada'))();

  TextColumn get estadoUbicacion =>
      text().withDefault(const Constant('pendiente'))();

  TextColumn get urlFuente => text().nullable()();

  DateTimeColumn get fechaVerificacion => dateTime().nullable()();

  BoolColumn get activo => boolean().withDefault(const Constant(true))();
}
