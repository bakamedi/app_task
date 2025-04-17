import 'package:flutter/material.dart';

import 'widgets/body_task_w.dart';
import 'widgets/header_task_w.dart';
import 'widgets/tab_task_w.dart';
import 'widgets/title_header_w.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHeaderW(),
          Expanded(child: TabTaskW(header: HeaderTaskW(), body: BodyTaskW())),
        ],
      ),
    );
  }
}
