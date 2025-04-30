import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/utils/router_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';

void addTask() async {
  final taskController = taskProvider.read();
  final newTaskController = newTaskProvider.read();
  final snackbarGC = snackbarGP.read();

  final isValid = newTaskController.formTaskKey!.currentState!.validate();
  if (!isValid) {
    return;
  }

  final tasks = taskController.all;

  await newTaskController.addTask(tasks);
  RouterUtil.pop();
  snackbarGC.show('Added task successfully');
  taskController.init();
}
