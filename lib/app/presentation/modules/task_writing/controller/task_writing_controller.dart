import 'dart:convert';

import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:signature/signature.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/tasks/new/new_task_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../../global/extensions/task_ext.dart';
import '../../../global/router/router_gc.dart';
import 'task_writing_state.dart';

final taskWritingProvider =
    Provider.state<TaskWritingController, TaskWritingState>(
      (_) => TaskWritingController(
        TaskWritingState.initialState,
        newTaskUseCase: UseCases.newTaskUseCase.read(),
      ),
    );

class TaskWritingController extends StateNotifier<TaskWritingState> {
  TaskWritingController(
    super.initialState, {
    required NewTaskUseCase newTaskUseCase,
  }) : _newTaskUseCase = newTaskUseCase;

  final NewTaskUseCase _newTaskUseCase;

  SignatureController get signature => state.signatureController!;

  void onUndo() {
    if (signature.canUndo) {
      signature.undo();
    }
  }

  void onRedo() {
    if (signature.canRedo) {
      signature.redo();
    }
  }

  void onDelete() {
    signature.clear();
  }

  Future<void> onSave() async {
    if (state.signatureController != null &&
        state.signatureController!.isNotEmpty) {
      final bytes = await state.signatureController!.toPngBytes();
      if (bytes != null) {
        final base64Image = base64Encode(bytes);
        final task = Task.empty()
            .copyWith(title: 'Tarea manuscrita', description: base64Image)
            .withGeneratedId();

        await _newTaskUseCase.call(task);
        routerGP.read().pop();
      }
    }
  }

  @override
  void dispose() {
    state.signatureController?.dispose();
    super.dispose();
  }
}
