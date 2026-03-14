import 'package:flutter/material.dart';

class ActionBtnW extends StatelessWidget {
  const ActionBtnW({
    super.key,
    required this.icon,
    this.onTap,
    this.enabled = true,
    this.active = false,
    this.color,
    this.size = 44,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final bool enabled;
  final bool active;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? Theme.of(context).colorScheme.primary;

    Color background;
    Color iconColor;

    if (!enabled) {
      background = Colors.transparent;
      iconColor = Colors.white38;
    } else if (active) {
      background = baseColor;
      iconColor = Colors.white;
    } else {
      background = baseColor.withValues(alpha: .15);
      iconColor = baseColor;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, size: size * 0.45, color: iconColor),
      ),
    );
  }
}
