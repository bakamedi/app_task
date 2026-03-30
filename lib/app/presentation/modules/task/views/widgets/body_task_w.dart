import 'package:flutter/material.dart';

import '../../../../global/widgets/async_widget/app_state_handler_gw.dart';
import '../../controllers/task_controller.dart';
import 'tasks_w.dart';

class BodyTaskW extends StatelessWidget {
  const BodyTaskW({super.key, required this.taskController});

  final TaskController taskController;

  @override
  Widget build(BuildContext context) {
    return AppStateHandlerGW(
      appViewState: taskController.state.appViewState,
      onSuccess: (context, _) => TabBarView(
        children: [
          TasksW(tasks: taskController.all),
          TasksW(tasks: taskController.todoTasks),
          TasksW(tasks: taskController.completedTasks),
        ],
      ),
    );
  }
}
