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
      return 'Phone number cannot be empty';
    } else if (value.length != MAX_PHONE_LENGTH) {
      return 'Phone number must be $MAX_PHONE_LENGTH digits';
    } else if (value.contains(RegExp(r'\D'))) {
      return 'Invalid phone number';
    } else {
      return null;
    }
  }
}

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!value.isValidEmail) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < MIN_PASSWORD_LENGTH) {
      return 'Password must be at least $MIN_PASSWORD_LENGTH characters';
    } else {
      return null;
    }
  }
}

class ConfirmPasswordValidator {
  static String? validate(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Password confirmation cannot be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}

class NamesValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
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
