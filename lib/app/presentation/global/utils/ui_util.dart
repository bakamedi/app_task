import 'dart:io';

import 'package:flutter/material.dart';

abstract class UiUtil {
  const UiUtil._();

  static void unFocusKeyboardIfNeeded(BuildContext context) {
    if (MediaQuery.viewInsetsOf(context).bottom > 0) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static bool isAndroid = Platform.isAndroid;
}
