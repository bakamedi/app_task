import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/widgets/titles/title_gw.dart';
import '../controllers/ui/new_task_ui_controller.dart';
import '../controllers/new_task_controller.dart';
import 'widgets/new_task_form_w.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);
    final adaptativeScreen = AdaptativeScreen(context);

    return Consumer(
      builder: (_, ref, _) {
        final newTaskController = ref.watch(newTaskProvider);
        final newTaskUIController = ref.watch(newTaskUIProvider);
        return Scaffold(
          appBar: AppBar(
            title: TitleGW(
              size: adaptativeScreen.dp(2.2),
              title: newTaskController.hasTask
                  ? appLocale.editTask
                  : appLocale.taskTitle,
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: NewTaskFormW(
            newTaskController: newTaskController,
            newTaskUIController: newTaskUIController,
          ),
        );
      },
    );
  }
}
