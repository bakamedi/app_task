import 'package:flutter/material.dart';

class SlideFromBottomTransition extends StatelessWidget {
  const SlideFromBottomTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Cambiar el desplazamiento inicial a uno más pequeño para suavizar
    const begin = Offset(0.0, 0.2); // más suave que 1.0
    const end = Offset.zero;
    const curve = Curves.easeOutCubic; // curva más suave

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }
}
