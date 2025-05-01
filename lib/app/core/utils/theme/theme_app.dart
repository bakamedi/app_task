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
      tabBarTheme: const TabBarTheme(
        labelColor: DarkColors.darkOnSurface,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: DarkColors.darkPrimary,
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
    tabBarTheme: const TabBarTheme(
      labelColor: LightColors.lightOnSurface,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: LightColors.lightPrimary,
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
  );
}
