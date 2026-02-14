import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../controllers/loader/loader_gc.dart';

class LoaderGW extends ConsumerWidget {
  const LoaderGW({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final isLoading = ref.watch(loaderGP).loading;

    if (!isLoading) return const SizedBox.shrink();

    return const _LoaderOverlay();
  }
}

class _LoaderOverlay extends StatelessWidget {
  const _LoaderOverlay();

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen.of(context);

    return PopScope(
      canPop: false,
      child: Material(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: ColoredBox(
            color: Colors.black.withValues(alpha: 0.4),
            child: Center(
              child: Transform.scale(
                scale: adaptativeScreen.dp(0.25),
                child: const CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
