import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/extensions/widgets_ext.dart';
import 'widgets/body_task_w.dart';
import 'widgets/expanded_create_fab_w.dart';
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandedCreateFabW(),
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
