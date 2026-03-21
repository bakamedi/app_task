import 'package:flutter/material.dart';
import 'dark_colors.dart';
import 'light_colors.dart';

class ThemeApp {
  // Singleton
  factory ThemeApp() => _instance;
  ThemeApp._();
  static final ThemeApp _instance = ThemeApp._();

  /// Accede al tema oscuro personalizado
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Manrope',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.darkBackground,
      primaryColor: DarkColors.darkPrimary,
      colorScheme: const ColorScheme.dark(
        surface: DarkColors.darkSurface,
        onSurface: DarkColors.darkOnSurface,
        primary: DarkColors.darkPrimary,
        onPrimary: DarkColors.darkOnPrimary,
        secondary: DarkColors.darkSecondary,
        onSecondary: DarkColors.darkOnSecondary,
        error: DarkColors.darkError,
        onError: DarkColors.darkOnError,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkColors.darkSurface,
        foregroundColor: DarkColors.darkOnSurface,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: DarkColors.darkOnBackground),
        bodyMedium: TextStyle(color: DarkColors.darkOnSurface),
      ),
      cardColor: DarkColors.darkSurface,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: DarkColors.darkSurface,
        contentTextStyle: const TextStyle(
          color: DarkColors.darkOnSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        actionTextColor: DarkColors.darkPrimary,
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightColors.lightBackground,
    primaryColor: LightColors.lightPrimary,
    colorScheme: const ColorScheme.light(
      surface: LightColors.lightSurface,
      onSurface: LightColors.lightOnSurface,
      primary: LightColors.lightPrimary,
      onPrimary: LightColors.lightOnPrimary,
      secondary: LightColors.lightSecondary,
      onSecondary: LightColors.lightOnSecondary,
      error: LightColors.lightError,
      onError: LightColors.lightOnError,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.lightSurface,
      foregroundColor: LightColors.lightOnSurface,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: LightColors.lightOnBackground),
      bodyMedium: TextStyle(color: LightColors.lightOnSurface),
    ),
    cardColor: LightColors.lightSurface,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: LightColors.lightSurface,
      contentTextStyle: const TextStyle(
        color: LightColors.lightOnSurface,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      actionTextColor: LightColors.lightPrimary,
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
