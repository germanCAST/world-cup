import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world_cup/core/constants/app_constants.dart';

class QuinelaPage extends StatelessWidget {
  const QuinelaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
        ),
        const SliverFillRemaining(
          child: Center(
            child: Text(
              'Quiniela\n(próximamente)',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.onBackground),
            ),
          ),
        ),
      ],
    );
  }
}
