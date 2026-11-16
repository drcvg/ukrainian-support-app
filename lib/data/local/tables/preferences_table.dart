
import 'package:drift/drift.dart';

class Preferences extends Table {
  IntColumn get idPreferencia => integer().autoIncrement()();

  TextColumn get idiomaInterfaz => text().withDefault(
        const Constant('es'),
      )();

  IntColumn get tamanoFuente => integer().withDefault(
        const Constant(16),
      )();
}
