import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

import '../../../global/extensions/widgets_ext.dart';
import '../controllers/splash_controller.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    ref.listen(
      splashProvider,
      callback: (notifier) async {
        final controller = notifier.state;
        if (controller.routeName.isNotEmpty && context.mounted) {
          context.pushReplacementNamed(controller.routeName);
        }
      },
    );
    return Scaffold(body: CircularProgressIndicator.adaptive().center);
  }
}
