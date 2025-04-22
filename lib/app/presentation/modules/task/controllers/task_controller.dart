import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/tasks/get_tasks_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../../global/extensions/copy_with_updater_ext.dart';
import 'task_state.dart';

final taskProvider = Provider.state<TaskController, TaskState>(
  (_) => TaskController(
    TaskState.initialState,
    getTasksUseCase: UseCases.getTasksUseCase.read(),
  ),
);

class TaskController extends StateNotifier<TaskState> {
  TaskController(super.initialState, {required GetTasksUseCase getTasksUseCase})
    : _getTasksUseCase = getTasksUseCase {
    init();
  }

  final GetTasksUseCase _getTasksUseCase;

  List<Task> get todoTasks => state.toDo;
  List<Task> get completedTasks => state.completed;

  Future<void> init() async {
    final tasks = await _getTasksUseCase.call();
    onlyUpdateWith(
      (state) => state.copyWith(
        toDo: tasks.where((task) => !task.completed).toList(),
        completed: tasks.where((task) => task.completed).toList(),
      ),
    );
  }
}
