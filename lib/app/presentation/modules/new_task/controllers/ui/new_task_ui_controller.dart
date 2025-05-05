import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'new_task_ui_state.dart';

final newTaskUIProvider = Provider.state<NewTaskUIController, NewTaskUiState>(
  (_) => NewTaskUIController(NewTaskUiState.initialState),
);

class NewTaskUIController extends StateNotifier<NewTaskUiState> {
  NewTaskUIController(super.initialState);

  GlobalKey<FormState>? get formTaskKey => state.formTaskKey;
}
