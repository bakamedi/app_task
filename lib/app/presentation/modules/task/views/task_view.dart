import 'package:flutter/material.dart';

import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/extensions/widgets_ext.dart';
import 'widgets/add_task_btn_w.dart';
import 'widgets/body_task_w.dart';
import 'widgets/header_task_w.dart';
import 'widgets/tab_task_w.dart';
import 'widgets/title_header_w.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final SnackbarGC snackbarController = snackbarGP.read();

    snackbarController.setContext(context);

    return Scaffold(
      floatingActionButton: AddTaskBtnW(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHeaderW(),
            TabTaskW(header: HeaderTaskW(), body: BodyTaskW()).expanded,
          ],
        ),
      ),
    );
  }
}
