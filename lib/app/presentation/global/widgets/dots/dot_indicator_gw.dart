import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  const DotIndicator({
    required this.color,
    this.radius = 4,
    this.padding = const EdgeInsets.only(bottom: 4),
  });

  final Color color;
  final double radius;
  @override
  final EdgeInsets padding;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(color: color, radius: radius, padding: padding);
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({
    required this.color,
    required this.radius,
    required this.padding,
  });

  final Color color;
  final double radius;
  final EdgeInsets padding;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = color;

    final double dx =
        offset.dx +
        padding.left +
        (configuration.size!.width - padding.horizontal) / 2;
    final double dy =
        offset.dy + configuration.size!.height - radius - padding.bottom;

    final Offset circleOffset = Offset(dx, dy);
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
