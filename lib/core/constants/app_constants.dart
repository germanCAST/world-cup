import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Paleta principal
  static const Color primary = Color(0xFF00FF41);
  static const Color secondary = Color(0xFF2D005E);
  static const Color tertiary = Color(0xFFFFD700);
  static const Color neutral = Color(0xFF121212);

  // Superficies (derivadas del neutral)
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1C1C1C);
  static const Color surfaceVariant = Color(0xFF2A2A2A);

  // Texto sobre cada color
  static const Color onPrimary = Color(0xFF000000);  // negro sobre verde brillante
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onTertiary = Color(0xFF000000); // negro sobre amarillo
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFFFFFFFF);

  // Estados
  static const Color error = Color(0xFFCF6679);
  static const Color onError = Color(0xFF000000);

  // Bordes y divisores
  static const Color outline = Color(0xFF3A3A3A);
}
