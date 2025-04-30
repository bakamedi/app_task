import 'dart:ui';

abstract class DarkColors {
  // Fondo general de la app
  static const Color darkBackground = Color(
    0xFF181818,
  ); // gris oscuro más suave que #121212
  static const Color darkOnBackground = Color(0xFFE0E0E0); // texto principal

  // Superficies como cards, sheets, etc.
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkOnSurface = Color(0xFFCCCCCC); // texto secundario

  // Primario (puede ser acento, botones, etc.)
  static const Color darkPrimary = Color(
    0xFFBB86FC,
  ); // Material Design recomendado
  static const Color darkOnPrimary = Color(
    0xFF000000,
  ); // texto en botón primario

  // Secundario (menos uso que primario)
  static const Color darkSecondary = Color(0xFF03DAC6);
  static const Color darkOnSecondary = Color(0xFF000000);

  // Errores
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkOnError = Color(0xFF000000);
}
