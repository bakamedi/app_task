import 'package:flutter/material.dart';
import '../dark_colors.dart';

class ThemeApp {
  // Singleton
  factory ThemeApp() => _instance;
  ThemeApp._();
  static final ThemeApp _instance = ThemeApp._();

  /// Accede al tema oscuro personalizado
  static ThemeData get darkTheme {
    return ThemeData(
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
}
