import '../../../../domain/models/task/task_model.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void deleteTask(Task task) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();

  await newTaskController.deleteTask(task);
  taskController.deleteTask(task);
}
