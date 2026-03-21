import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/extensions/widgets_ext.dart';
import '../controllers/task_controller.dart';
import 'widgets/body_task_w.dart';
import 'widgets/expanded_create_fab_w.dart';
import 'widgets/header_task_w.dart';
import 'widgets/tab_task_w.dart';
import 'widgets/title_header_w.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final taskController = ref.watch(taskProvider);

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandedCreateFabW(
        expandableKey: taskController.state.expandableKey,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleHeaderW(),
            TabTaskW(
              header: HeaderTaskW(),
              body: BodyTaskW(taskController: taskController),
            ).expanded,
          ],
        ),
      ),
    );
  }
}
