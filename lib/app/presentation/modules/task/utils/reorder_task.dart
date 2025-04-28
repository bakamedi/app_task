import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void reorderTask(int oldIndex, int newIndex) async {
  final tasksController = taskProvider.read();
  final newTaskUpdate = newTaskProvider.read();
  final newTaskController = newTaskProvider.read();

  final updTask = tasksController.reorderTasks(oldIndex, newIndex);

  final tasks = tasksController.all;

  await Future.wait(
    tasks.map((task) async => await newTaskUpdate.updateTask(task)),
  );

  await newTaskController.updateTask(updTask);
}
