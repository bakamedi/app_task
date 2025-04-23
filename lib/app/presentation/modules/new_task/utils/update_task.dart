import '../../../global/utils/router_util.dart';
import '../../task/controllers/task_controller.dart';
import '../controllers/new_task_controller.dart';

void updateTask() async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();

  final isValid = newTaskController.formTaskKey!.currentState!.validate();
  if (!isValid) {
    return;
  }
  final updTask = newTaskController.state.taskToAdd;
  await newTaskController.updateTask(updTask);

  RouterUtil.pop();
  taskController.init();
}
