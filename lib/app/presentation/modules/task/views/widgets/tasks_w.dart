import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../domain/models/task/task_model.dart';
import '../../../../global/widgets/scaffold/main_scaffold_gw.dart';
import '../../../../global/widgets/slidable/slidable_gw.dart';
import '../../utils/delete_task.dart';
import '../../utils/update_completed.dart';
import 'empty_task_w.dart';
import 'task_item_w.dart';

class TasksW extends ConsumerWidget {
  const TasksW({super.key, required this.tasks});
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    return MainScaffoldGW(
      isEmpty: tasks.isEmpty,
      emptyBody: EmptyTaskW(),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          final task = tasks[index];
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                GlobalSlidableActionGW(
                  foregroundColor: Colors.red,
                  iconData: Icons.delete_outline_outlined,
                  label: 'Borrar',
                  onPressed: (context) => deleteTask(task),
                ),
              ],
            ),
            child: TaskItemW(
              title: task.title,
              description: task.description,
              completed: task.completed,
              onTap: () => updateCompleted(task),
            ),
          );
        },
      ),
    );
  }
}
