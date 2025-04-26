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

  // Accesos rápidos al estado
  List<Task> get todoTasks => state.toDo;
  List<Task> get completedTasks => state.completed;
  List<Task> get all => state.all;

  /// Inicializa el estado trayendo las tareas
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

  /// Cambiar el estado de completado de una tarea
  void onChangeCompleted(Task task) {
    final updatedTask = task.copyWith(completed: !task.completed);

    // Quitar la tarea de sus listas actuales
    final updatedToDo = List<Task>.from(state.toDo)
      ..removeWhere((t) => t.id == task.id);
    final updatedCompleted = List<Task>.from(state.completed)
      ..removeWhere((t) => t.id == task.id);

    // Actualizar lista completa
    final updatedAll =
        state.all.map((t) {
          return t.id == task.id ? updatedTask : t;
        }).toList();

    // Añadir la tarea a la lista correspondiente
    if (updatedTask.completed) {
      updatedCompleted.add(updatedTask);
    } else {
      updatedToDo.add(updatedTask);
    }

    onlyUpdateWith(
      (state) => state.copyWith(
        toDo: updatedToDo,
        completed: updatedCompleted,
        all: updatedAll,
      ),
    );
  }

  /// Borrar una tarea
  void deleteTask(Task task) {
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

  void reorderTasks(int oldIndex, int newIndex) {
    onlyUpdateWith((state) => state.reorderTasks(oldIndex, newIndex));

    // Aquí podrías añadir lógica para persistir el nuevo orden si es necesario
    // await _someUseCase.reorderTasks(state.all);
  }
}
