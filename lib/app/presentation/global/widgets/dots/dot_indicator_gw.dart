import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  const DotIndicator({required this.color, this.radius = 4});
  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(color: color, radius: radius);
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({required this.color, required this.radius});
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = color;
    final Offset circleOffset = Offset(
      offset.dx + configuration.size!.width / 2,
      offset.dy + configuration.size!.height - radius - 4,
    );
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
