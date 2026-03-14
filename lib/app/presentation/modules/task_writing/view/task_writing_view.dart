import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/widgets/titles/title_gw.dart';
import '../controller/task_writing_controller.dart';
import '../utils/on_erase_all.dart';
import '../utils/on_redo.dart';
import '../utils/on_undo.dart';
import 'widgets/draw_task_w.dart';
import 'widgets/task_fab_toolbar_w.dart';

class TaskWritingView extends ConsumerWidget {
  const TaskWritingView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appLocale = AppLocalizations.of(context);
    final adaptativeScreen = AdaptativeScreen(context);
    final taskWritingController = ref.watch(taskWritingProvider);
    final signature = taskWritingController.signature;

    return Scaffold(
      appBar: AppBar(
        title: TitleGW(
          size: adaptativeScreen.dp(2.2),
          title: appLocale.newTask,
        ),
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
            onSave: taskWritingController.onSave,
          );
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: DrawTaskW(signatureController: signature),
    );
  }
}
