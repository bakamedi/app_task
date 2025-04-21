abstract class TaskValidators {
  TaskValidators._();

  // Constantes de validación
  static const int maxTitleLength = 50;
  static const int maxDescriptionLength = 200;

  static const String emptyTitleError = 'El título no puede estar vacío';
  static const String longTitleError =
      'El título no puede tener más de $maxTitleLength caracteres';

  static const String emptyDescriptionError =
      'La descripción no puede estar vacía';
  static const String longDescriptionError =
      'La descripción no puede tener más de $maxDescriptionLength caracteres';

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return emptyTitleError;
    } else if (value.trim().length > maxTitleLength) {
      return longTitleError;
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return emptyDescriptionError;
    } else if (value.trim().length > maxDescriptionLength) {
      return longDescriptionError;
    }
    return null;
  }
}
