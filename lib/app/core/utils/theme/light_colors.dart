import 'dart:ui';

abstract class LightColors {
  // Fondo general de la app
  static const Color lightBackground = Color(0xFFFFFFFF); // blanco puro
  static const Color lightOnBackground = Color(
    0xFF000000,
  ); // texto principal en fondo claro

  // Superficies como cards, sheets, etc.
  static const Color lightSurface = Color(
    0xFFF5F5F5,
  ); // gris muy claro para superficies
  static const Color lightOnSurface = Color(0xFF212121); // texto secundario

  // Primario (puede ser acento, botones, etc.)
  static const Color lightPrimary = Color(
    0xFF6200EE,
  ); // Material Design recomendado
  static const Color lightOnPrimary = Color(
    0xFFFFFFFF,
  ); // texto sobre botón primario

  // Secundario (menos uso que primario)
  static const Color lightSecondary = Color(0xFF03DAC6);
  static const Color lightOnSecondary = Color(0xFF000000);

  // Errores
  static const Color lightError = Color(0xFFB00020);
  static const Color lightOnError = Color(0xFFFFFFFF);
}
