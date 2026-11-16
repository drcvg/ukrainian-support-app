
import 'package:drift/drift.dart';

import 'categories_table.dart';
import 'organizations_table.dart';

class OfficialResources extends Table {
  IntColumn get idRecurso => integer().autoIncrement()();

  TextColumn get identificador => text().unique()();

  IntColumn get idCategoria => integer().references(
        Categories,
        #idCategoria,
      )();

  IntColumn get idOrganizacion => integer().references(
        Organizations,
        #idOrganizacion,
      )();

  TextColumn get titulo => text()();

  TextColumn get descripcion => text()();

  TextColumn get urlOficial => text()();

  DateTimeColumn get fechaVerificacion => dateTime().nullable()();

  BoolColumn get activo => boolean().withDefault(
        const Constant(true),
      )();
}
