import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../../../../../domain/models/user/user_model.dart';
import '../../../controllers/session/controller/session_gc.dart';
import '../../../extensions/widgets_ext.dart';

class SessionGV extends ConsumerWidget {
  const SessionGV({
    super.key,
    required this.onSuccess,
    this.onLoading,
    this.onUnauthenticated,
    this.onError,
  });
  final Widget Function(UserModel user) onSuccess;
  final Widget Function()? onLoading;
  final Widget Function()? onUnauthenticated;
  final Widget Function(String error)? onError;

  @override
  Widget build(BuildContext context, ref) {
    final session = ref.watch(sessionGP);

    switch (session.state.status) {
      case .loading:
        return onLoading?.call() ??
            const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()),
            );

      case .authenticated:
        return onSuccess(session.state.user);

      case .unauthenticated:
        return onUnauthenticated?.call() ??
            const Scaffold(body: Center(child: Text("Not authenticated")));

      case .error:
        return onError?.call(session.state.error ?? "Unknown error") ??
            Scaffold(body: Text(session.state.error ?? "Error").center);
    }
  }
}
