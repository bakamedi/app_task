import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../../domain/models/task/task_model.dart';
import '../../../../global/widgets/scaffold/main_scaffold_gw.dart';
import '../../utils/delete_task.dart';
import '../../utils/go_task.dart';
import '../../utils/reorder_task.dart';
import '../../utils/update_completed.dart';
import 'empty_task_w.dart';
import 'slidable_task_item_w.dart';

class TasksW extends ConsumerWidget {
  const TasksW({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final primaryColor = Theme.of(context).primaryColor;

    return MainScaffoldGW(
      isEmpty: tasks.isEmpty,
      emptyBody: const EmptyTaskW(),
      body: ReorderableListView.builder(
        onReorder: reorderTask,
        padding: EdgeInsets.zero,
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return SlidableTaskItemW(
            key: ValueKey(task.id),
            task: task,
            deleteTask: (task) => deleteTask(task),
            goTask: (task) => goTask(task),
            updateCompleted: (task) => updateCompleted(task),
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
                  borderRadius: BorderRadius.circular(12),
                  child: child,
                ),
              );
            },
            child: child,
          );
        },
      ),
    );
  }
}
