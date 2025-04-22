import 'package:flutter_meedu/providers.dart';

import '../../inject_repository.dart';
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
}
