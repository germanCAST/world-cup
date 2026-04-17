import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup/core/constants/app_constants.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(context),
      body: navigationShell,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── Bottom Navigation Bar ──────────────────────────────────────────────────

  Widget _buildBottomNav() {
    return NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) => navigationShell.goBranch(
        index,
        // Si ya está en el tab, vuelve a la ruta raíz de esa rama
        initialLocation: index == navigationShell.currentIndex,
      ),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.groups_outlined),
          selectedIcon: Icon(Icons.groups),
          label: 'Equipos',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: 'Fixture',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: 'Quiniela',
        ),
      ],
    );
  }

  // ── Drawer / Sidebar ───────────────────────────────────────────────────────

  Widget _buildDrawer(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;

    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Text(
                "THE PULSE OF '26",
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: AppColors.outline),
            ),
            const SizedBox(height: 8),
            _drawerItem(
              context,
              icon: Icons.groups_outlined,
              label: 'Equipos',
              selected: currentIndex == 0,
              onTap: () {
                Navigator.of(context).pop();
                navigationShell.goBranch(0);
              },
            ),
            _drawerItem(
              context,
              icon: Icons.calendar_month_outlined,
              label: 'Fixture',
              selected: currentIndex == 1,
              onTap: () {
                Navigator.of(context).pop();
                navigationShell.goBranch(1);
              },
            ),
            _drawerItem(
              context,
              icon: Icons.emoji_events_outlined,
              label: 'Posiciones',
              selected: false,
              onTap: () => Navigator.of(context).pop(),
            ),
            _drawerItem(
              context,
              icon: Icons.bar_chart_outlined,
              label: 'Quiniela',
              selected: currentIndex == 2,
              onTap: () {
                Navigator.of(context).pop();
                navigationShell.goBranch(2);
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: AppColors.outline),
            ),
            _drawerItem(
              context,
              icon: Icons.settings_outlined,
              label: 'Configuración',
              selected: false,
              onTap: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: Icon(
        icon,
        color: selected ? AppColors.primary : const Color(0xFF7A7A7A),
        size: 22,
      ),
      title: Text(
        label,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: selected ? AppColors.primary : AppColors.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }
}
