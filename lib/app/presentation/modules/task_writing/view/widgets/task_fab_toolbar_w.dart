import 'dart:ui';
import 'package:flutter/material.dart';

class TaskFabToolbarW extends StatelessWidget {
  const TaskFabToolbarW({
    super.key,
    this.onUndo,
    this.onRedo,
    this.onDelete,
    this.onSave,
    this.undoActive = false,
    this.redoActive = false,
  });
  final VoidCallback? onUndo;
  final VoidCallback? onRedo;
  final VoidCallback? onDelete;
  final VoidCallback? onSave;

  final bool undoActive;
  final bool redoActive;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.12),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(.15)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _button(
                icon: Icons.undo,
                active: undoActive,
                color: primary,
                onTap: onUndo,
              ),
              _divider(),
              _button(
                icon: Icons.redo,
                active: redoActive,
                color: primary,
                onTap: onRedo,
              ),
              _divider(),
              _button(icon: Icons.delete_outline, onTap: onDelete),
              _divider(),
              _button(
                icon: Icons.check,
                color: primary,
                active: true,
                onTap: onSave,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 28,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.white.withOpacity(.15),
    );
  }

  Widget _button({
    required IconData icon,
    VoidCallback? onTap,
    bool active = false,
    Color? color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: active ? color?.withOpacity(.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, size: 20, color: active ? color : Colors.white70),
      ),
    );
  }
}
