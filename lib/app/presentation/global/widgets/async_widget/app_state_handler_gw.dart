import 'package:flutter/material.dart';

import '../../extensions/widgets_ext.dart';
import '../../utils/app_view_state_util.dart';
import '../errors/error_gw.dart';

class AppStateHandlerGW extends StatelessWidget {
  const AppStateHandlerGW({
    super.key,
    required this.appViewState,
    required this.onSuccess,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.idleWidget,
  });

  /// Obligatorios
  final AppViewStateUtil appViewState;
  final Widget Function(BuildContext context) onSuccess;

  /// Opcionales
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? idleWidget;

  @override
  Widget build(BuildContext context) {
    switch (appViewState) {
      case AppViewStateUtil.loading:
        return loadingWidget ??
            const CircularProgressIndicator.adaptive().center;
      case AppViewStateUtil.error:
        return errorWidget ?? const ErrorGW();
      case AppViewStateUtil.empty:
        return emptyWidget ?? Text('No data').center;
      case AppViewStateUtil.success:
        return onSuccess(context);
      case AppViewStateUtil.idle:
        return idleWidget ?? const SizedBox.shrink();
    }
  }
}
