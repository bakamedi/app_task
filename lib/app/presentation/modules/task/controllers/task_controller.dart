import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/tasks/task_classifier.dart';
import '../../../../domain/uses_cases/tasks/gets/get_tasks_use_case.dart';
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

  /// Inicializa el estado trayendo las tareas desde el caso de uso `getTasksUseCase`
  /// y clasifica las tareas en pendientes y completadas.
  Future<void> init() async {
    final tasks =
        await _getTasksUseCase.call(); // Obtiene las tareas desde el backend
    final classified = TaskClassifier.from(
      tasks,
    ); // Clasifica las tareas en pendientes y completadas

    // Actualiza el estado con las tareas clasificadas
    onlyUpdateWith(
      (state) => state.copyWith(
        all: classified.all,
        toDo: classified.toDo,
        completed: classified.completed,
      ),
    );
  }

  /// Cambia el estado de completado de una tarea.
  /// Actualiza la tarea y la coloca en la lista correspondiente (pendientes o completadas).
  void onChangeCompleted(Task task) {
    final updatedTask = task.copyWith(
      completed: !task.completed,
    ); // Cambia el estado de 'completed'
    final classified = TaskClassifier.from(
      state.all,
    ).updateTask(updatedTask); // Actualiza la lista de tareas

    // Actualiza el estado con las nuevas listas
    onlyUpdateWith(
      (state) => state.copyWith(
        all: classified.all,
        toDo: classified.toDo,
        completed: classified.completed,
      ),
    );
  }

  /// Elimina una tarea de las listas correspondientes.
  /// Elimina la tarea de todas las listas: pendientes, completadas y todas.
  void deleteTask(Task task) {
    final classified = TaskClassifier.from(
      state.all,
    ).deleteTask(task); // Elimina la tarea

    // Actualiza el estado con las nuevas listas sin la tarea eliminada
    onlyUpdateWith(
      (state) => state.copyWith(
        all: classified.all,
        toDo: classified.toDo,
        completed: classified.completed,
      ),
    );
  }

  /// Reordena las tareas, moviendo una tarea de una posición a otra.
  /// Actualiza el estado con las tareas reordenadas y retorna la tarea que fue movida.
  Task reorderTasks(int oldIndex, int newIndex) {
    final classified = TaskClassifier.from(
      state.all,
    ).reorderTasks(oldIndex, newIndex); // Reordena las tareas

    // Actualiza el estado con las tareas reordenadas
    onlyUpdateWith(
      (state) => state.copyWith(
        all: classified.all,
        toDo: classified.toDo,
        completed: classified.completed,
      ),
    );

    // Retorna la tarea que fue movida
    return classified.all.firstWhere((task) => task.order == newIndex);
  }
}
