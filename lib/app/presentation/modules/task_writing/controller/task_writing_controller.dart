import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:signature/signature.dart';

import '../../../../core/success/success.dart';
import '../../../../core/utils/theme/extensions/future_either_ext.dart';
import '../../../../domain/defs/task_creation_source.dart';
import '../../../../domain/defs/type_defs.dart';
import '../../../../domain/models/failures/failure.dart';
import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/google_text_recognition/process_image_to_text_use_case.dart';
import '../../../../domain/uses_cases/tasks/gets/get_order_by_tasks_params.dart';
import '../../../../domain/uses_cases/tasks/gets/get_order_by_tasks_use_case.dart';
import '../../../../domain/uses_cases/tasks/new/new_task_use_case.dart';
import '../../../../domain/uses_cases/uses_cases.dart';
import '../../../global/extensions/task_ext.dart';
import 'task_writing_state.dart';

final taskWritingProvider =
    Provider.state<TaskWritingController, TaskWritingState>(
      (_) => TaskWritingController(
        TaskWritingState.initialState,
        newTaskUseCase: UseCases.newTaskUseCase.read(),
        processImageToTextUseCase: UseCases.processImageToTextUseCase.read(),
        getOrderByTasksUseCase: UseCases.getOrderByTasksUseCase.read(),
      ),
    );

class TaskWritingController extends StateNotifier<TaskWritingState> {
  TaskWritingController(
    super.initialState, {
    required NewTaskUseCase newTaskUseCase,
    required ProcessImageToTextUseCase processImageToTextUseCase,
    required GetOrderByTasksUseCase getOrderByTasksUseCase,
  }) : _newTaskUseCase = newTaskUseCase,
       _processImageToTextUseCase = processImageToTextUseCase,
       _getOrderByTasksUseCase = getOrderByTasksUseCase;

  final NewTaskUseCase _newTaskUseCase;
  final ProcessImageToTextUseCase _processImageToTextUseCase;
  final GetOrderByTasksUseCase _getOrderByTasksUseCase;

  SignatureController get signature => state.signatureController!;

  void onInit(bool isDarkMode) {
    onlyUpdate(
      state = state.copyWith(
        signatureController: SignatureController(
          penStrokeWidth: 4,
          penColor: isDarkMode ? Colors.white : Colors.black,
          exportBackgroundColor: Colors.white,
        ),
      ),
    );
  }

  FutureEither<Failure, Success> addTask(List<Task> tasks) async {
    return await _getOrderByTasksUseCase(
      GetOrderByTasksParams(taskToAdd: state.taskToAdd, currentTasks: tasks),
    ).flatMap((task) {
      final newTask = task.withGeneratedId();

      return _newTaskUseCase(
        TaskFromWriting(task: newTask, signature: signature),
      );
    });
  }

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

  void onTitleChanged(String title) {
    onlyUpdate(
      state = state.copyWith(taskToAdd: state.taskToAdd.copyWith(title: title)),
    );
  }

  Future<bool?> processImage() async {
    final controller = state.signatureController;

    if (controller == null || controller.isEmpty) {
      return null;
    }

    try {
      final bytes = await controller.toPngBytes();
      if (bytes == null) {
        return null;
      }

      final description = await _processImageToTextUseCase.call(bytes: bytes);

      onlyUpdate(
        state = state.copyWith(
          taskToAdd: state.taskToAdd.copyWith(description: description ?? ''),
        ),
      );

      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    state.signatureController?.dispose();
    super.dispose();
  }
}
