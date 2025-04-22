import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/task/task_model.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default([]) List<Task> toDo,
    @Default([]) List<Task> completed,
    @Default(Task(id: '', title: '', description: '', completed: false))
    Task tastToAdd,
  }) = _TaskState;

  static TaskState get initialState =>
      TaskState(toDo: const [], completed: const [], tastToAdd: Task.empty());
}
