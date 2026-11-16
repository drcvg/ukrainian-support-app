
import 'package:drift/drift.dart';

import '../../features/organizations/models/organization_model.dart'
    as model;
import '../../features/organizations/models/organization_location_model.dart'
    as location_model;
import '../local/app_database.dart';

class OrganizationsRepository {
  final AppDatabase database;

  OrganizationsRepository(this.database);

  /// Observa las organizaciones activas y sus ubicaciones.
  Stream<List<model.Organization>> watchOrganizations() {
    final query = database.select(database.organizations)
      ..where((table) => table.activo.equals(true))
      ..orderBy([(table) => OrderingTerm.asc(table.nombre)]);

    return query.watch().asyncMap((rows) async {
      final organizations = <model.Organization>[];

      for (final row in rows) {
        final locationQuery = database.select(
          database.organizationLocations,
        )
          ..where(
            (table) =>
                table.idOrganizacion.equals(row.idOrganizacion) &
                table.activo.equals(true),
          )
          ..orderBy([
            (table) => OrderingTerm.asc(table.ciudad),
            (table) => OrderingTerm.asc(table.nombreSede),
          ]);

        final locationRows = await locationQuery.get();

        final locations = locationRows.map((location) {
          return location_model.OrganizationLocation(
            id: location.idUbicacion,
            organizationId: location.idOrganizacion,
            name: location.nombreSede,
            city: location.ciudad,
            address: location.direccion,
            phone: location.telefono,
            email: location.email,
            attentionMode: location.modalidadAtencion,
            locationStatus: location.estadoUbicacion,
            sourceUrl: location.urlFuente,
            verificationDate: location.fechaVerificacion,
            active: location.activo,
            identifier: location.identificador,
          );
        }).toList();

        organizations.add(
          model.Organization(
            id: row.identificador,
            name: row.nombre,
            category: row.tipoOrganizacion,
            description: row.descripcion,
            city: row.ciudad ?? '',
            address: row.direccion ?? '',
            phone: row.telefono ?? '',
            email: row.email ?? '',
            website: row.urlOficial ?? '',
            modalidadAtencion: row.modalidadAtencion,
            estadoUbicacion: row.estadoUbicacion,
            locations: locations,
          ),
        );
      }

      return organizations;
    });
  }
}
