import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_task_state.freezed.dart';

@freezed
abstract class NewTaskState with _$NewTaskState {
  const NewTaskState._();

  const factory NewTaskState({GlobalKey<FormState>? formTaskKey}) =
      _NewTaskState;

  static NewTaskState get initialState =>
      NewTaskState(formTaskKey: GlobalKey<FormState>());
}
