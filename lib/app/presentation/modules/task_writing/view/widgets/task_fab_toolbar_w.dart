import 'dart:ui';
import 'package:flutter/material.dart';

import 'action_btn_w.dart';

class TaskFabToolbarW extends StatelessWidget {
  const TaskFabToolbarW({
    super.key,
    this.onUndo,
    this.onRedo,
    this.onDelete,
    this.onSave,
    this.undoActive = false,
    this.redoActive = false,
    this.deleteActive = false,
  });
  final VoidCallback? onUndo;
  final VoidCallback? onRedo;
  final VoidCallback? onDelete;
  final VoidCallback? onSave;

  final bool undoActive;
  final bool redoActive;
  final bool deleteActive;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: .blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 56,
          padding: const .symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .12),
            borderRadius: .circular(28),
            border: .all(color: Colors.white.withValues(alpha: .15)),
          ),
          child: Row(
            mainAxisSize: .min,
            children: [
              ActionBtnW(
                icon: Icons.undo,
                active: undoActive,
                color: primary,
                onTap: onUndo,
              ),
              _divider(),
              ActionBtnW(
                icon: Icons.redo,
                active: redoActive,
                color: primary,
                onTap: onRedo,
              ),
              _divider(),
              ActionBtnW(
                icon: Icons.delete_outline,
                active: deleteActive,
                color: primary,
                onTap: onDelete,
              ),
              _divider(),
              ActionBtnW(
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
      margin: const .symmetric(horizontal: 4),
      color: Colors.white.withValues(alpha: .15),
    );
  }
}
