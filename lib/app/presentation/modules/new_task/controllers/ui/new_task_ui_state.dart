import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_task_ui_state.freezed.dart';

@freezed
abstract class NewTaskUiState with _$NewTaskUiState {
  const NewTaskUiState._();

  const factory NewTaskUiState({GlobalKey<FormState>? formTaskKey}) =
      _NewTaskUiState;

  static NewTaskUiState get initialState =>
      NewTaskUiState(formTaskKey: GlobalKey<FormState>());
}
