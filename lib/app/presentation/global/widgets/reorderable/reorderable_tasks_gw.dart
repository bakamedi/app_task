import 'package:flutter/material.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../modules/task/views/widgets/slidable_task_item_w.dart';

class ReorderableTasksGW extends StatelessWidget {
  const ReorderableTasksGW({
    super.key,
    required this.onReorder,
    required this.tasks,
    required this.deleteTask,
    required this.goTask,
    required this.updateCompleted,
  });
  final List<Task> tasks;
  final void Function(Task) deleteTask;
  final void Function(Task) goTask;
  final void Function(Task) updateCompleted;
  final void Function(int, int) onReorder;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ReorderableListView.builder(
      onReorder: onReorder,
      padding: .zero,
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final task = tasks[index];
        return SlidableTaskItemW(
          key: ValueKey(task.id),
          task: task,
          deleteTask: deleteTask,
          goTask: goTask,
          updateCompleted: updateCompleted,
        );
      },
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
                borderRadius: .circular(12),
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
