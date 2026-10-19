import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme.dart';

class UkrainianSupportApp extends StatelessWidget {
  const UkrainianSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ukrainian Support',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}