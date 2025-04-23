import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../controllers/task_controller.dart';
import 'tasks_w.dart';

class BodyTaskW extends ConsumerWidget {
  const BodyTaskW({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final taskController = ref.watch(taskProvider);
    return TabBarView(
      children: [
        TasksW(tasks: taskController.all),
        TasksW(tasks: taskController.todoTasks),
        TasksW(tasks: taskController.completedTasks),
      ],
    );
  }
}
