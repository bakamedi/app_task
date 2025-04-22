import 'package:flutter/material.dart';

import '../../../../../domain/models/task/task_model.dart';
import '../../../../global/widgets/main_scaffold_gw.dart';
import '../../utils/add_task.dart';
import 'empty_task_w.dart';
import 'task_item_w.dart';

class TasksW extends StatelessWidget {
  const TasksW({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return MainScaffoldGW(
      isEmpty: tasks.isEmpty,
      emptyBody: EmptyTaskW(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return TaskItemW(
            title: task.title,
            description: task.description,
            completed: task.completed,
            onTap: addTask,
          );
        },
      ),
    );
  }
}
