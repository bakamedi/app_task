import 'package:flutter/material.dart';

import '../../../../../domain/models/task/task_model.dart';
import '../../../../global/widgets/reorderable/reorderable_tasks_gw.dart';
import '../../../../global/widgets/scaffold/main_scaffold_gw.dart';
import '../../utils/delete_task.dart';
import '../../utils/go_task.dart';
import '../../utils/reorder_task.dart';
import '../../utils/update_completed.dart';
import 'empty_task_w.dart';

class TasksW extends StatelessWidget {
  const TasksW({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return MainScaffoldGW(
      isEmpty: tasks.isEmpty,
      emptyBody: const EmptyTaskW(),
      body: ReorderableTasksGW(
        tasks: tasks,
        onReorder: reorderTask,
        deleteTask: deleteTask,
        goTask: goTask,
        updateCompleted: updateCompleted,
      ),
    );
  }
}
