import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'new_task_state.dart';

final newTaskProvider = Provider.state<NewTaskController, NewTaskState>(
  (_) => NewTaskController(NewTaskState.initialState),
);

class NewTaskController extends StateNotifier<NewTaskState> {
  NewTaskController(super.initialState);

  GlobalKey<FormState>? get formTaskKey => state.formTaskKey;
}
