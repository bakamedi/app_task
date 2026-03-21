import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:signature/signature.dart';

import '../../../../domain/models/task/task_model.dart';

part 'task_writing_state.freezed.dart';

@freezed
abstract class TaskWritingState with _$TaskWritingState {
  const TaskWritingState._();

  const factory TaskWritingState({
    @Default(
      Task(
        id: '',
        title: '',
        description: '',
        completed: false,
        createdAt: '',
        order: 0,
      ),
    )
    Task taskToAdd,
    SignatureController? signatureController,
  }) = _TaskWritingState;

  static TaskWritingState get initialState => TaskWritingState();
}
