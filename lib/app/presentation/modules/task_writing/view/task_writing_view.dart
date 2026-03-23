import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/extensions/context_ext.dart';
import '../../../global/utils/ui_util.dart';
import '../controller/task_writing_controller.dart';
import '../utils/on_erase_all.dart';
import '../utils/on_redo.dart';
import '../utils/create_task_from_writing.dart';
import '../utils/on_undo.dart';
import 'widgets/draw_task_w.dart';
import 'widgets/task_fab_toolbar_w.dart';
import 'widgets/text_input_title_w.dart';

class TaskWritingView extends ConsumerWidget {
  const TaskWritingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final taskWritingController = ref.watch(taskWritingProvider);
    taskWritingController.onInit(context.isDarkMode);
    final signature = taskWritingController.signature;

    return GestureDetector(
      onTap: () => UiUtil.unFocusKeyboardIfNeeded(context),
      child: Scaffold(
        appBar: AppBar(
          title: TextInputTitleW(taskWritingController: taskWritingController),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ListenableBuilder(
          listenable: signature,
          builder: (_, _) {
            return TaskFabToolbarW(
              undoActive: signature.canUndo,
              redoActive: signature.canRedo,
              deleteActive: signature.isNotEmpty,
              onUndo: onUndo,
              onRedo: onRedo,
              onDelete: onEraseAll,
              onSave: () => createTaskFromWriting(),
            );
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: DrawTaskW(signatureController: signature),
      ),
    );
  }
}
