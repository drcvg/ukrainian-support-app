import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/translation/presentation/pages/translation_page.dart';
import '../features/administrative_procedures/presentation/page/procedures_page.dart';
import '../features/administrative_procedures/presentation/page/procedure_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/translation',
      builder: (context, state) => const TranslationPage(),
    ),
    GoRoute(
      path: '/administrative-procedures',
      builder: (context, state) => const ProceduresPage(),
    ),
    GoRoute(
      path: '/administrative-procedures/:id',
      builder: (context, state) =>
          ProcedureDetailPage(procedureId: state.pathParameters['id']!),
    ),
  ],
);
