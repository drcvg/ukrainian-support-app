
import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get idCategoria => integer().autoIncrement()();

  TextColumn get nombre => text()();

  TextColumn get descripcion => text()();

  BoolColumn get activo => boolean().withDefault(
        const Constant(true),
      )();
}
