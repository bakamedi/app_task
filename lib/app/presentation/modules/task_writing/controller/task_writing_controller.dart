import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';

import 'task_writing_state.dart';

final taskWritingProvider =
    Provider.state<TaskWritingController, TaskWritingState>(
      (_) => TaskWritingController(TaskWritingState.initialState),
    );

class TaskWritingController extends StateNotifier<TaskWritingState> {
  TaskWritingController(super.initialState);
}
