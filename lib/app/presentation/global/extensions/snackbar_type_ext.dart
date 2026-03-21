import 'package:flutter/material.dart';

import '../snackbar/snackbar_type.dart';

extension SnackbarTypeExt on SnackbarType {
  Color getColor(ColorScheme scheme) {
    switch (this) {
      case SnackbarType.success:
        return scheme.primary; // o custom si quieres
      case SnackbarType.error:
        return scheme.error;
      case SnackbarType.info:
        return scheme.secondary;
    }
  }

  Color getTextColor(ColorScheme scheme) {
    switch (this) {
      case SnackbarType.success:
        return scheme.onPrimary;
      case SnackbarType.error:
        return scheme.onError;
      case SnackbarType.info:
        return scheme.onSecondary;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackbarType.success:
        return Icons.check_circle;
      case SnackbarType.error:
        return Icons.error;
      case SnackbarType.info:
        return Icons.info;
    }
  }
}
