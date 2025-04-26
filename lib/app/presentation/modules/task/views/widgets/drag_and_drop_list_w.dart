import 'package:flutter/material.dart';

import '../../../../../domain/models/task/task_model.dart';

class DragAndDropListW extends StatelessWidget {
  const DragAndDropListW({
    super.key,
    required this.itemBuilder,
    required this.onReorder,
    required this.tasks,
  });
  final Widget Function(BuildContext, int) itemBuilder;
  final void Function(int, int) onReorder;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ReorderableListView.builder(
      onReorder: onReorder,
      padding: EdgeInsets.zero,
      itemCount: tasks.length,
      itemBuilder: itemBuilder,
      proxyDecorator: (Widget child, int index, Animation<double> animation) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, child) {
            final double scale = 1 + (0.05 * curvedAnimation.value);
            final double elevation = 8.0 * curvedAnimation.value;

            return Transform.scale(
              scale: scale,
              child: Material(
                elevation: elevation,
                color: primaryColor.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }
}
