import '../../../../domain/models/task/task_model.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void updateCompleted(Task task) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();
  final updTask = task.copyWith(completed: !task.completed);
  await newTaskController.updateTask(updTask);
  taskController.onChangeCompleted(task);
}
