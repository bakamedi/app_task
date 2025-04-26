import 'package:flutter_meedu/providers.dart';

import '../../inject_repository.dart';
import 'snackbar/set_context_use_case.dart';
import 'snackbar/show_snackbar_use_case.dart';
import 'tasks/delete_task_use_case.dart';
import 'tasks/get_last_order_use_case.dart';
import 'tasks/get_tasks_use_case.dart';
import 'tasks/new_task_use_case.dart';
import 'tasks/update_task_use_case.dart';

class UseCases {
  UseCases._();

  static final getTasksUseCase = Provider(
    (ref) => GetTasksUseCase(taskRepository: Repositories.taskRep.read()),
  );

  static final newTaskUseCase = Provider(
    (ref) => NewTaskUseCase(taskRepository: Repositories.taskRep.read()),
  );

  static final updateTaskUseCase = Provider(
    (ref) => UpdateTaskUseCase(taskRepository: Repositories.taskRep.read()),
  );

  static final deleteTaskUseCase = Provider(
    (ref) => DeleteTaskUseCase(taskRepository: Repositories.taskRep.read()),
  );

  static final showSnackbarUseCase = Provider(
    (ref) => ShowSnackbarUseCase(
      snackbarRepository: Repositories.snackbarRep.read(),
    ),
  );

  static final setContextUseCase = Provider(
    (ref) =>
        SetContextUseCase(snackbarRepository: Repositories.snackbarRep.read()),
  );

  static final getLastOrderUseCase = Provider(
    (ref) => GetLastOrderUseCase(taskRepository: Repositories.taskRep.read()),
  );
}
