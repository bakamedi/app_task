import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../domain/models/task/task_model.dart';
import '../../../../global/widgets/slidable/slidable_gw.dart';
import 'task_item_w.dart';

class SlidableTaskItemW extends StatelessWidget {
  const SlidableTaskItemW({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.goTask,
    required this.updateCompleted,
  });
  final Task task;
  final Function(Task) deleteTask;
  final Function(Task) goTask;
  final Function(Task) updateCompleted;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(
        task.id,
      ), // Usar task.id en lugar del index para mejor rendimiento
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          GlobalSlidableActionGW(
            foregroundColor: Colors.red,
            iconData: Icons.delete_outline_outlined,
            label: 'Borrar',
            onPressed: (context) => deleteTask(task),
          ),
        ],
      ),
      child: TaskItemW(
        key: ValueKey(task.id), // Mismo key que Slidable
        title: task.title,
        description: task.description,
        completed: task.completed,
        order: task.order,
        onTap: () => goTask(task),
        onCheckboxTap: () => updateCompleted(task),
      ),
    );
  }
}
