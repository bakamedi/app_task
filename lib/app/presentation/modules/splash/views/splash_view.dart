import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/extensions/widgets_ext.dart';
import '../../../global/utils/router_util.dart';
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
          RouterUtil.pushReplacement(controller.routeName);
        }
      },
    );
    return Scaffold(body: CircularProgressIndicator.adaptive().center);
  }
}
