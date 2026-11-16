import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/organizations/models/organization_model.dart' as model;
import '../../features/organizations/models/organization_location_model.dart'
    as location_model;
import '../repositories/organizations_repository.dart';
import '../repositories/organization_locations_repository.dart';
import '../../features/resources/models/resource_model.dart';
import '../repositories/resources_repository.dart';
import 'app_database.dart';

/// Proporciona la instancia de la base de datos SQLite.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('La base de datos todavía no ha sido inicializada.');
});

/// Proporciona el repositorio de organizaciones.
final organizationsRepositoryProvider = Provider<OrganizationsRepository>((
  ref,
) {
  final database = ref.watch(appDatabaseProvider);

  return OrganizationsRepository(database);
});

/// Observa las organizaciones activas almacenadas en SQLite.
final organizationsProvider = StreamProvider<List<model.Organization>>((ref) {
  final repository = ref.watch(organizationsRepositoryProvider);

  return repository.watchOrganizations();
});

/// Proporciona el repositorio de ubicaciones.
final organizationLocationsRepositoryProvider =
    Provider<OrganizationLocationsRepository>((ref) {
      final database = ref.watch(appDatabaseProvider);

      return OrganizationLocationsRepository(database);
    });

/// Observa las sedes activas de una organización.
final organizationLocationsProvider =
    StreamProvider.family<List<location_model.OrganizationLocation>, int>((
      ref,
      organizationId,
    ) {
      final repository = ref.watch(organizationLocationsRepositoryProvider);

      return repository.watchLocations(organizationId);
    });

/// Proporciona el repositorio de recursos oficiales.
final resourcesRepositoryProvider = Provider<ResourcesRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);

  return ResourcesRepository(database);
});

/// Observa los recursos oficiales activos almacenados en SQLite.
final resourcesProvider = StreamProvider<List<Resource>>((ref) {
  final repository = ref.watch(resourcesRepositoryProvider);

  return repository.watchResources();
});
