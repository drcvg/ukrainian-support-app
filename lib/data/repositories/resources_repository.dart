import 'package:drift/drift.dart';

import '../../features/resources/models/resource_model.dart';
import '../local/app_database.dart';

class ResourcesRepository {
  final AppDatabase _database;

  ResourcesRepository(this._database);

  Stream<List<Resource>> watchResources() {
    final query = _database.select(_database.officialResources).join([
      innerJoin(
        _database.categories,
        _database.categories.idCategoria.equalsExp(
          _database.officialResources.idCategoria,
        ),
      ),
      innerJoin(
        _database.organizations,
        _database.organizations.idOrganizacion.equalsExp(
          _database.officialResources.idOrganizacion,
        ),
      ),
    ]);

    query.where(_database.officialResources.activo.equals(true));

    return query.watch().map((rows) {
      return rows.map((row) {
        final resource = row.readTable(_database.officialResources);
        final category = row.readTable(_database.categories);
        final organization = row.readTable(_database.organizations);

        return Resource(
          id: resource.identificador,
          title: resource.titulo,
          category: category.nombre,
          description: resource.descripcion,
          officialUrl: resource.urlOficial,
          organizationName: organization.nombre,
          verificationDate: resource.fechaVerificacion,
        );
      }).toList();
    });
  }
}
