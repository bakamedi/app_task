abstract class TaskValidators {
  TaskValidators._();

  // Validation constants
  static const int maxTitleLength = 50;
  static const int maxDescriptionLength = 200;

  static const String emptyTitleError = 'Title cannot be empty';
  static const String longTitleError =
      'Title cannot be longer than $maxTitleLength characters';

  static const String emptyDescriptionError = 'Description cannot be empty';
  static const String longDescriptionError =
      'Description cannot be longer than $maxDescriptionLength characters';

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
