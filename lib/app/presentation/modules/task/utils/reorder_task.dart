import '../../../global/extensions/failure_ext.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

Future<void> reorderTask(int oldIndex, int newIndex) async {
  final tasksController = taskProvider.read();
  final newTaskController = newTaskProvider.read();

  final updTask = tasksController.reorderTasks(oldIndex, newIndex);
  final tasks = tasksController.all;

  for (final task in tasks) {
    final result = await newTaskController.updateTask(task);

    if (result.isLeft) {
      result.getLeftOrNull()!.show();
      return;
    }
  }

  final finalResult = await newTaskController.updateTask(updTask);

  finalResult.ifLeft((failure) => failure.show());
}
