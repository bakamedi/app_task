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
  List<Task> get all => state.all;

  Future<void> init() async {
    final tasks = await _getTasksUseCase.call();
    onlyUpdateWith(
      (state) => state.copyWith(
        all: tasks,
        toDo: tasks.where((task) => !task.completed).toList(),
        completed: tasks.where((task) => task.completed).toList(),
      ),
    );
  }

  void onChangeCompleted(Task task) {
    final updatedTask = task.copyWith(completed: !task.completed);

    final updatedToDo = List<Task>.from(state.toDo)
      ..removeWhere((t) => t.id == task.id);
    final updatedCompleted = List<Task>.from(state.completed)
      ..removeWhere((t) => t.id == task.id);
    final updatedAll =
        state.all.map((t) => t.id == task.id ? updatedTask : t).toList();

    (updatedTask.completed ? updatedCompleted : updatedToDo).add(updatedTask);

    onlyUpdateWith(
      (state) => state.copyWith(
        toDo: updatedToDo,
        completed: updatedCompleted,
        all: updatedAll,
      ),
    );
  }

  void deleteTask(Task task) async {
    final isCompleted = task.completed;

    onlyUpdateWith((state) {
      return state.copyWith(
        all: state.all.where((t) => t.id != task.id).toList(),
        toDo:
            isCompleted
                ? state.toDo
                : state.toDo.where((t) => t.id != task.id).toList(),
        completed:
            isCompleted
                ? state.completed.where((t) => t.id != task.id).toList()
                : state.completed,
      );
    });
  }
}
