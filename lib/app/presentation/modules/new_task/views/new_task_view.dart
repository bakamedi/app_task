import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/extensions/responsive_num_ext.dart';
import '../../../global/utils/l10n_util.dart';
import '../../../global/widgets/titles/title_gw.dart';
import '../controllers/ui/new_task_ui_controller.dart';
import '../controllers/new_task_controller.dart';
import 'widgets/new_task_form_w.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        final newTaskController = ref.watch(newTaskProvider);
        final newTaskUIController = ref.watch(newTaskUIProvider);
        return Scaffold(
          appBar: AppBar(
            title: TitleGW(
              size: 2.2.sp,
              title: newTaskController.hasTask
                  ? L10nUtil.t.editTask
                  : L10nUtil.t.taskTitle,
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
