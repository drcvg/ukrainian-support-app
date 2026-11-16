import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/categories_table.dart';
import 'tables/organizations_table.dart';
import 'tables/official_resources_table.dart';
import 'tables/preferences_table.dart';
import 'tables/organization_locations_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Categories,
    Organizations,
    OrganizationLocations,
    OfficialResources,
    Preferences,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        if (!await _hasColumn('organizations', 'modalidad_atencion')) {
          await m.addColumn(organizations, organizations.modalidadAtencion);
        }

        if (!await _hasColumn('organizations', 'estado_ubicacion')) {
          await m.addColumn(organizations, organizations.estadoUbicacion);
        }
      }

      if (from < 3) {
        if (!await _hasColumn('organization_locations', 'id_ubicacion')) {
          await m.createTable(organizationLocations);
        }
      }

      if (from < 4) {
        if (!await _hasColumn('organization_locations', 'identificador')) {
          await m.addColumn(
            organizationLocations,
            organizationLocations.identificador,
          );
        }
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
  Future<bool> _hasColumn(String tableName, String columnName) async {
    final columns = await customSelect('PRAGMA table_info("$tableName")').get();

    return columns.any((row) => row.read<String>('name') == columnName);
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'ukrainian_support');
}
