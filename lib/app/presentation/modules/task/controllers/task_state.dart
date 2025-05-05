import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/task/task_model.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default([]) List<Task> toDo,
    @Default([]) List<Task> completed,
    @Default([]) List<Task> all,
  }) = _TaskState;

  static TaskState get initialState =>
      const TaskState(toDo: [], completed: [], all: []);

  TaskState reorderTasks(int oldIndex, int newIndex) {
    final updatedAll = List<Task>.from(all);

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final Task item = updatedAll.removeAt(oldIndex);
    updatedAll.insert(newIndex, item);

    return copyWith(
      all: updatedAll,
      toDo: updatedAll.where((task) => !task.completed).toList(),
      completed: updatedAll.where((task) => task.completed).toList(),
    );
  }

  TaskState updateWithAll(List<Task> newAll) {
    final toDo = <Task>[];
    final completed = <Task>[];

    for (final task in newAll) {
      (task.completed ? completed : toDo).add(task);
    }

    return copyWith(all: newAll, toDo: toDo, completed: completed);
  }
}
