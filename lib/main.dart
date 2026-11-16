import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'data/local/app_database.dart';
import 'data/local/database_providers.dart';
import 'data/local/seed/initial_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar la base de datos SQLite.
  final database = AppDatabase();

  // Cargar los datos iniciales.
  await loadInitialData(database);

  // Iniciar la aplicación con la base de datos disponible.
  runApp(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
      child: const UkrainianSupportApp(),
    ),
  );
}
