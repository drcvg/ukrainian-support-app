import 'package:drift/drift.dart';

class Organizations extends Table {
  IntColumn get idOrganizacion => integer().autoIncrement()();

  TextColumn get identificador => text().unique()();

  TextColumn get nombre => text()();

  TextColumn get tipoOrganizacion => text()();

  TextColumn get descripcion => text()();

  TextColumn get ciudad => text().nullable()();

  TextColumn get direccion => text().nullable()();

  TextColumn get telefono => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get urlOficial => text().nullable()();
  TextColumn get modalidadAtencion =>
      text().withDefault(const Constant('no_confirmada'))();

  TextColumn get estadoUbicacion =>
      text().withDefault(const Constant('pendiente'))();

  BoolColumn get activo => boolean().withDefault(const Constant(true))();
}
