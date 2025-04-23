import '../../../global/utils/router_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';

void addTask() async {
  final taskController = taskProvider.read();
  final newTaskController = newTaskProvider.read();

  final isValid = newTaskController.formTaskKey!.currentState!.validate();
  if (!isValid) {
    return;
  }

  await newTaskController.addTask();
  RouterUtil.pop();
  taskController.init();
}
