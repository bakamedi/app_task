import 'package:flutter/material.dart';

import '../../controllers/task_controller.dart';
import 'tasks_w.dart';

class BodyTaskW extends StatelessWidget {
  const BodyTaskW({super.key, required this.taskController});

  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        TasksW(tasks: taskController.all),
        TasksW(tasks: taskController.todoTasks),
        TasksW(tasks: taskController.completedTasks),
      ],
    );
  }
}
