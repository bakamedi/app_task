import 'package:flutter/material.dart';

import '../../extensions/widgets_ext.dart';
import '../../utils/app_view_state_util.dart';
import '../errors/error_gw.dart';

class AppStateHandlerGW<T> extends StatelessWidget {
  const AppStateHandlerGW({
    super.key,
    required this.appViewState,
    required this.onSuccess,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.idleWidget,
  });

  final AppViewState appViewState;
  final Widget Function(BuildContext context, T data) onSuccess;

  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? idleWidget;

  @override
  Widget build(BuildContext context) {
    return switch (appViewState) {
      Loading() =>
        loadingWidget ?? const CircularProgressIndicator.adaptive().center,

      Error(:final message) => errorWidget ?? ErrorGW(error: message),

      Empty() => emptyWidget ?? Text('No data').center,

      Success<T>(:final data) => onSuccess(context, data),

      Idle() => idleWidget ?? const SizedBox.shrink(),

      _ => const SizedBox.shrink(),
    };
  }
}
