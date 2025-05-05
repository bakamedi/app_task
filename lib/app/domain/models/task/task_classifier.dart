import 'task_model.dart';

class TaskClassifier {
  factory TaskClassifier.from(List<Task> tasks) {
    final toDo = <Task>[];
    final completed = <Task>[];

    for (final task in tasks) {
      (task.completed ? completed : toDo).add(task);
    }

    return TaskClassifier._(tasks, toDo, completed);
  }

  TaskClassifier._(this.all, this.toDo, this.completed);
  final List<Task> all;
  final List<Task> toDo;
  final List<Task> completed;

  /// Actualiza una tarea en la lista de todas las tareas.
  /// Retorna un nuevo `TaskClassifier` con la tarea actualizada.
  TaskClassifier updateTask(Task updatedTask) {
    final updatedAll =
        all.map((task) {
          return task.id == updatedTask.id
              ? updatedTask
              : task; // Reemplaza la tarea
        }).toList();

    return TaskClassifier.from(
      updatedAll,
    ); // Retorna el clasificador actualizado
  }

  /// Elimina una tarea de todas las listas (todas, pendientes y completadas).
  /// Retorna un nuevo `TaskClassifier` con la tarea eliminada.
  TaskClassifier deleteTask(Task task) {
    final updatedAll =
        all
            .where((t) => t.id != task.id)
            .toList(); // Elimina de todas las tareas
    final updatedToDo =
        toDo
            .where((t) => t.id != task.id)
            .toList(); // Elimina de las tareas pendientes
    final updatedCompleted =
        completed
            .where((t) => t.id != task.id)
            .toList(); // Elimina de las completadas

    return TaskClassifier._(
      updatedAll,
      updatedToDo,
      updatedCompleted,
    ); // Retorna el nuevo clasificador
  }

  /// Reordena las tareas, moviendo una tarea de una posición a otra.
  /// Actualiza el 'order' de las tareas y retorna un nuevo `TaskClassifier` con las tareas reordenadas.
  TaskClassifier reorderTasks(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1; // Ajusta el índice si la tarea fue movida hacia abajo
    }

    // Copia la lista de tareas
    final List<Task> updatedTasks = List.from(all);

    // Remueve la tarea de la lista y la inserta en el nuevo índice
    final Task movedTask = updatedTasks.removeAt(oldIndex);
    updatedTasks.insert(newIndex, movedTask);

    // Actualiza el 'order' de cada tarea
    final List<Task> finalTasks =
        updatedTasks.asMap().entries.map((entry) {
          final index = entry.key;
          final task = entry.value;
          return task.copyWith(order: index); // Asigna el nuevo índice de orden
        }).toList();

    return TaskClassifier.from(
      finalTasks,
    ); // Retorna el clasificador actualizado con las tareas reordenadas
  }
}
