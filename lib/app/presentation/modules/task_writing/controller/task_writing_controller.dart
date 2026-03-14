import 'package:flutter_meedu/providers.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:signature/signature.dart';

import '../../../../domain/models/task/task_model.dart';
import '../../../../domain/uses_cases/google_text_recognition/process_image_to_text_use_case.dart';
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

  Future<void> addTask(List<Task> tasks) async {
    final taskByOrder = await _getOrderByTasksUseCase.call(
      state.taskToAdd,
      tasks,
    );
    await _newTaskUseCase.call(taskByOrder.withGeneratedId());
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
        print('Error: bytes are null');
        return null;
      }

      print('Processing image of size: ${bytes.length} bytes');
      final description = await _processImageToTextUseCase.call(bytes: bytes);
      print('Recognized text: $description');

      onlyUpdate(
        state = state.copyWith(
          taskToAdd: state.taskToAdd.copyWith(description: description ?? ''),
        ),
      );

      return true;
    } catch (e) {
      print('Error in processImage: $e');
      return null;
    }
  }

  @override
  void dispose() {
    state.signatureController?.dispose();
    super.dispose();
  }
}
