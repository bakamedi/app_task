import 'package:flutter/material.dart';
import '../extensions/snackbar_type_ext.dart';
import '../snackbar/app_scaffold_messenger.dart';
import '../snackbar/snackbar_type.dart';

class SnackbarUtil {
  static ScaffoldMessengerState? get _messenger =>
      AppScaffoldMessenger.messengerKey.currentState;

  static void show(String message, {SnackbarType type = SnackbarType.success}) {
    final context = AppScaffoldMessenger.messengerKey.currentContext;

    if (context == null) return;

    final scheme = Theme.of(context).colorScheme;

    _messenger?.clearSnackBars();

    _messenger?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: type.getColor(scheme),
        content: Row(
          spacing: 8,
          children: [
            Icon(type.icon, color: type.getTextColor(scheme)),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: type.getTextColor(scheme)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void hide() {
    _messenger?.hideCurrentSnackBar();
  }
}
