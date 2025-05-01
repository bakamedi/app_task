import 'package:flutter_meedu/providers.dart';

import 'index_uses_cases.dart';

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

  static final getOrderByTasksUseCase = Provider(
    (ref) =>
        GetOrderByTasksUseCase(taskRepository: Repositories.taskRep.read()),
  );

  static final getPreferencesUseCase = Provider(
    (ref) => GetUserPreferencesUseCase(
      preferenceRepository: Repositories.userPreferenceRep.read(),
    ),
  );
  static final savePreferencesUseCase = Provider(
    (ref) => SetUserPreferencesUseCase(
      preferenceRepository: Repositories.userPreferenceRep.read(),
    ),
  );
}
