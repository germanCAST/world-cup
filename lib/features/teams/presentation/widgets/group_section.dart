import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup/core/constants/app_constants.dart';
import 'team_card.dart';

class TeamData {
  const TeamData({
    required this.code,
    required this.name,
    required this.confederation,
  });

  final String code;
  final String name;
  final String confederation;
}

class GroupSection extends StatelessWidget {
  const GroupSection({
    super.key,
    required this.groupName,
    required this.teams,
    this.label,
    this.onTeamTap,
  });

  /// Ej: "GRUPO A"
  final String groupName;

  /// Etiqueta lateral opcional: "NACIONES ANFITRIONAS", "SEMILLA 1: BRASIL"
  final String? label;

  final List<TeamData> teams;
  final void Function(TeamData team)? onTeamTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Encabezado del grupo ─────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              groupName,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: AppColors.onBackground,
              ),
            ),
            if (label != null)
              Text(
                label!,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                  letterSpacing: 0.5,
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Lista de equipos ─────────────────────────────────────────────
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: teams.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final team = teams[index];
            return TeamCard(
              code: team.code,
              name: team.name,
              confederation: team.confederation,
              onTap: onTeamTap != null ? () => onTeamTap!(team) : null,
            );
          },
        ),
      ],
    );
  }
}
