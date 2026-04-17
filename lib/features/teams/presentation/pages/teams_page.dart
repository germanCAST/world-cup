import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup/core/constants/app_constants.dart';
import '../widgets/group_section.dart';

// ── Datos mockeados (se reemplazarán con data real de la capa domain) ────────

const _grupos = [
  (
    nombre: 'GRUPO A',
    etiqueta: 'NACIONES ANFITRIONAS',
    equipos: [
      TeamData(code: 'US', name: 'Estados Unidos', confederation: 'CONCACAF'),
      TeamData(code: 'MX', name: 'México', confederation: 'CONCACAF'),
      TeamData(code: 'CA', name: 'Canadá', confederation: 'CONCACAF'),
      TeamData(code: 'NG', name: 'Nigeria', confederation: 'CAF'),
    ],
  ),
  (
    nombre: 'GRUPO B',
    etiqueta: 'SEMILLA 1: BRASIL',
    equipos: [
      TeamData(code: 'BR', name: 'Brasil', confederation: 'CONMEBOL'),
      TeamData(code: 'ES', name: 'España', confederation: 'UEFA'),
      TeamData(code: 'JP', name: 'Japón', confederation: 'AFC'),
      TeamData(code: 'MA', name: 'Marruecos', confederation: 'CAF'),
    ],
  ),
  (
    nombre: 'GRUPO C',
    etiqueta: 'SEMILLA 1: ARGENTINA',
    equipos: [
      TeamData(code: 'AR', name: 'Argentina', confederation: 'CONMEBOL'),
      TeamData(code: 'FR', name: 'Francia', confederation: 'UEFA'),
      TeamData(code: 'AU', name: 'Australia', confederation: 'AFC'),
      TeamData(code: 'SN', name: 'Senegal', confederation: 'CAF'),
    ],
  ),
];

const _filtros = ['TODOS', 'GRUPO A-D', 'GRUPO E-H', 'GRUPO I-L'];

// ── Página ───────────────────────────────────────────────────────────────────

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  int _filtroSeleccionado = 0;
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNav(),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPhaseBadge(),
                  const SizedBox(height: 16),
                  _buildTitle(),
                  const SizedBox(height: 12),
                  _buildSubtitle(),
                  const SizedBox(height: 24),
                  _buildFilterChips(),
                  const SizedBox(height: 28),
                  _buildGroupList(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────────────────

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: Builder(
        builder: (ctx) => IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: () => Scaffold.of(ctx).openDrawer(),
        ),
      ),
      title: Text(
        "Copa Mundial '26",
        style: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          color: AppColors.primary,
          letterSpacing: 1,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.surfaceVariant,
            child: const Icon(Icons.emoji_events_outlined,
                color: AppColors.onSurface, size: 18),
          ),
        ),
      ],
    );
  }

  // ── Badge de fase ──────────────────────────────────────────────────────────

  Widget _buildPhaseBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'FASE DEL TORNEO: FASE DE GRUPOS',
        style: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.onSecondary,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // ── Título ─────────────────────────────────────────────────────────────────

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'GLOBALES ',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppColors.onBackground,
            ),
          ),
          TextSpan(
            text: 'CONTENDIENTES',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Subtítulo ──────────────────────────────────────────────────────────────

  Widget _buildSubtitle() {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFAAAAAA),
          height: 1.6,
        ),
        children: const [
          TextSpan(
            text:
                'Explora las 48 naciones que compiten por el título definitivo '
                'en la Copa del Mundo más grande de la historia a través de ',
          ),
          TextSpan(
            text: 'Norteamérica.',
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  // ── Filtros horizontales ───────────────────────────────────────────────────

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_filtros.length, (i) {
          final selected = i == _filtroSeleccionado;
          return Padding(
            padding: EdgeInsets.only(right: i < _filtros.length - 1 ? 10 : 0),
            child: GestureDetector(
              onTap: () => setState(() => _filtroSeleccionado = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      selected ? AppColors.secondary : AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(20),
                  border: selected
                      ? null
                      : Border.all(color: AppColors.outline, width: 1),
                ),
                child: Text(
                  _filtros[i],
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: selected
                        ? AppColors.onSecondary
                        : const Color(0xFFAAAAAA),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Lista de grupos (reutiliza GroupSection) ───────────────────────────────

  Widget _buildGroupList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _grupos.length,
      separatorBuilder: (_, __) => const SizedBox(height: 32),
      itemBuilder: (context, index) {
        final grupo = _grupos[index];
        return GroupSection(
          groupName: grupo.nombre,
          label: grupo.etiqueta,
          teams: grupo.equipos,
          onTeamTap: (team) {
            // TODO: navegar al detalle del equipo con go_router
          },
        );
      },
    );
  }

  // ── Bottom Navigation Bar ──────────────────────────────────────────────────

  Widget _buildBottomNav() {
    return NavigationBar(
      selectedIndex: _navIndex,
      onDestinationSelected: (i) => setState(() => _navIndex = i),
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
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo / título
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
            _drawerItem(Icons.groups_outlined, 'Equipos', selected: true),
            _drawerItem(Icons.calendar_month_outlined, 'Fixture'),
            _drawerItem(Icons.emoji_events_outlined, 'Posiciones'),
            _drawerItem(Icons.bar_chart_outlined, 'Quiniela'),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: AppColors.outline),
            ),
            _drawerItem(Icons.settings_outlined, 'Configuración'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, {bool selected = false}) {
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
      onTap: () {},
    );
  }
}
