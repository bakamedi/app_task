import '../../../domain/models/task/task_model.dart';
import '../../modules/task/controllers/task_controller.dart';
import '../controllers/snackbar/snackbar_gc.dart';
import 'router_util.dart';

Future<void> saveTask({
  required List<Task> tasks,
  required Future<void> Function(List<Task>) addTask,
  required TaskController taskController,
  required SnackbarGC snackbar,
  required String message,
}) async {
  await addTask(tasks);

  RouterUtil.pop();
  snackbar.show(message);
  taskController.init();
}
