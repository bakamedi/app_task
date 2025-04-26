import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/task/task_model.dart';

part 'new_task_state.freezed.dart';

@freezed
abstract class NewTaskState with _$NewTaskState {
  const NewTaskState._();

  const factory NewTaskState({
    GlobalKey<FormState>? formTaskKey,
    @Default(
      Task(
        id: '',
        title: '',
        description: '',
        completed: false,
        createdAt: '',
        order: 1,
      ),
    )
    Task taskToAdd,
  }) = _NewTaskState;

  static NewTaskState get initialState => NewTaskState(
    formTaskKey: GlobalKey<FormState>(),
    taskToAdd: Task.empty(),
  );
}
