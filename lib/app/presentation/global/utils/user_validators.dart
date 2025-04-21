// ignore_for_file: constant_identifier_names

import '../extensions/strings_ext.dart';

const int MAX_PHONE_LENGTH = 10;
const int MAX_CALENDAR_LENGTH = 10;
const int MIN_PASSWORD_LENGTH = 6;
const int LEGAL_AGE = 18;
const String EMAIL_REGEX = r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';

class PhoneValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'El telefono no puede estar vacio';
    } else if (value.length != MAX_PHONE_LENGTH) {
      return 'Tamaño max de 10';
    } else if (value.contains(RegExp(r'\D'))) {
      return 'No es un número valido';
    } else {
      return null;
    }
  }
}

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email no puede estar vacio';
    } else if (!value.isValidEmail) {
      return 'No es un email valido';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña no puede estar vacio';
    } else if (value.length < MIN_PASSWORD_LENGTH) {
      return 'La contraseña debe de tener al menos 6 caracteres';
    } else {
      return null;
    }
  }
}

class ConfirmPasswordValidator {
  static String? validate(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'La confirmación de la contraseña no puede estar vacía';
    } else if (password != confirmPassword) {
      return 'Las contraseñas no coinciden';
    } else {
      return null;
    }
  }
}

class NamesValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre no puede estar vacio';
    } else {
      return null;
    }
  }
}

abstract class UserValidator {
  UserValidator._();
  static String? validatePhoneNumber(String? value) {
    return PhoneValidator.validate(value);
  }

  static String? validateEmail(String? value) {
    return EmailValidator.validate(value);
  }

  static String? validatePassword(String? value) {
    return PasswordValidator.validate(value);
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    return ConfirmPasswordValidator.validate(password, confirmPassword);
  }

  static String? validateNames(String? value) {
    return NamesValidator.validate(value);
  }
}
