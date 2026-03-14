import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/widgets/titles/title_gw.dart';
import '../utils/on_erase_all.dart';
import '../utils/on_redo.dart';
import '../utils/on_undo.dart';
import 'widgets/draw_task_w.dart';
import 'widgets/task_fab_toolbar_w.dart';

class TaskWritingView extends StatelessWidget {
  const TaskWritingView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);
    final adaptativeScreen = AdaptativeScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: TitleGW(
          size: adaptativeScreen.dp(2.2),
          title: 'Escribe tus tareas',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TaskFabToolbarW(
        undoActive: true,
        redoActive: false,
        onUndo: onUndo,
        onRedo: onRedo,
        onDelete: onEraseAll,
        onSave: () {},
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: DrawTaskW(),
    );
  }
}

class TaskFabToolbar {}
