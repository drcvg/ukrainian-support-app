import 'package:drift/drift.dart';

import '../../features/organizations/models/organization_location_model.dart'
    as model;
import '../local/app_database.dart';

class OrganizationLocationsRepository {
  final AppDatabase database;

  OrganizationLocationsRepository(this.database);

  /// Observa las sedes activas de una organización.
  Stream<List<model.OrganizationLocation>> watchLocations(int organizationId) {
    final query = database.select(database.organizationLocations)
      ..where(
        (table) =>
            table.idOrganizacion.equals(organizationId) &
            table.activo.equals(true),
      )
      ..orderBy([
        (table) => OrderingTerm.asc(table.ciudad),
        (table) => OrderingTerm.asc(table.nombreSede),
      ]);

    return query.watch().map(
      (rows) => rows.map((row) {
        return model.OrganizationLocation(
          id: row.idUbicacion,
          organizationId: row.idOrganizacion,
          name: row.nombreSede,
          city: row.ciudad,
          address: row.direccion,
          phone: row.telefono,
          email: row.email,
          attentionMode: row.modalidadAtencion,
          locationStatus: row.estadoUbicacion,
          sourceUrl: row.urlFuente,
          verificationDate: row.fechaVerificacion,
          active: row.activo,
          identifier: row.identificador,
        );
      }).toList(),
    );
  }
}
