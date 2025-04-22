import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import '../../../../domain/uses_cases/tasks/new_task_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../../global/extensions/copy_with_updater_ext.dart';
import '../../../global/extensions/task_ext.dart';
import 'new_task_state.dart';

final newTaskProvider = Provider.state<NewTaskController, NewTaskState>(
  (_) => NewTaskController(
    NewTaskState.initialState,
    newTaskUseCase: UseCases.newTaskUseCase.read(),
  ),
);

class NewTaskController extends StateNotifier<NewTaskState> {
  NewTaskController(
    super.initialState, {
    required NewTaskUseCase newTaskUseCase,
  }) : _newTaskUseCase = newTaskUseCase;

  final NewTaskUseCase _newTaskUseCase;

  GlobalKey<FormState>? get formTaskKey => state.formTaskKey;

  Future<void> addTask() async {
    await _newTaskUseCase.call(state.tastToAdd.withGeneratedId());
  }

  void onChangeTitle(String? title) {
    onlyUpdateWith(
      (state) => state.copyWith(
        tastToAdd: state.tastToAdd.copyWith(title: title ?? ''),
      ),
    );
  }

  void onChangeDescription(String? description) {
    onlyUpdateWith(
      (state) => state.copyWith(
        tastToAdd: state.tastToAdd.copyWith(description: description ?? ''),
      ),
    );
  }

  void onChangeCompleted(bool completed) {
    onlyUpdateWith(
      (state) => state.copyWith(
        tastToAdd: state.tastToAdd.copyWith(completed: completed),
      ),
    );
  }
}
