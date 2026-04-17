import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:world_cup/features/fixtures/presentation/pages/fixtures_page.dart';
import 'package:world_cup/features/quinela/presentation/pages/quinela_page.dart';
import 'package:world_cup/features/teams/presentation/pages/teams_page.dart';
import 'package:world_cup/shared/widgets/scaffold_with_navbar.dart';

// ── Rutas ────────────────────────────────────────────────────────────────────

class AppRoutes {
  AppRoutes._();

  static const String equipos  = '/equipos';
  static const String fixture  = '/fixture';
  static const String quiniela = '/quiniela';
}

// ── Provider ─────────────────────────────────────────────────────────────────

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.equipos,
    debugLogDiagnostics: false,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavBar(navigationShell: navigationShell),
        branches: [
          // ── Tab 0: Equipos ───────────────────────────────────────────────
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.equipos,
                builder: (context, state) => const TeamsPage(),
              ),
            ],
          ),

          // ── Tab 1: Fixture ───────────────────────────────────────────────
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.fixture,
                builder: (context, state) => const FixturesPage(),
              ),
            ],
          ),

          // ── Tab 2: Quiniela ──────────────────────────────────────────────
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.quiniela,
                builder: (context, state) => const QuinelaPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
