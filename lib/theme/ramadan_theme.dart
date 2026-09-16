import 'package:flutter/material.dart';

class RamadanColors {
  static const background = Color(0xFF1A1A1A);
  static const surface = Color(0xFF2A2A2A);
  static const surfaceLight = Color(0xFF3A3A3A);
  static const gold = Color(0xFFC5A55A);
  static const goldLight = Color(0xFFD4AF37);
  static const goldDark = Color(0xFFA89B4C);
  static const textPrimary = Color(0xFFE8DCC8);
  static const textSecondary = Color(0xFFA89B8C);
  static const textMuted = Color(0xFF6B6358);
  static const border = Color(0xFF3A3A3A);
  static const borderLight = Color(0xFF4A4A4A);
  static const shadowDark = Color(0xFF0D0D0D);
  static const shadowLight = Color(0xFF2A2A2A);
  static const accent = gold;
  static const error = Color(0xFFCF6679);
}

class RamadanTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: RamadanColors.background,
      colorScheme: const ColorScheme.dark(
        primary: RamadanColors.gold,
        secondary: RamadanColors.goldLight,
        surface: RamadanColors.surface,
        error: RamadanColors.error,
        onPrimary: RamadanColors.background,
        onSecondary: RamadanColors.background,
        onSurface: RamadanColors.textPrimary,
        onError: RamadanColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: RamadanColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: RamadanColors.gold),
      ),
      cardTheme: CardThemeData(
        color: RamadanColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: RamadanColors.border, width: 1),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: RamadanColors.border,
        thickness: 1,
      ),
      iconTheme: const IconThemeData(
        color: RamadanColors.gold,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: RamadanColors.textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: RamadanColors.textSecondary,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: RamadanColors.textMuted,
          fontSize: 12,
        ),
        labelLarge: TextStyle(
          color: RamadanColors.gold,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: RamadanColors.gold,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
