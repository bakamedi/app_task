import '../../../domain/models/task/task_model.dart';
import '../../modules/task/controllers/task_controller.dart';
import 'router_util.dart';
import 'snackbar_util.dart';

Future<void> saveTask({
  required List<Task> tasks,
  required Future<void> Function(List<Task>) addTask,
  required TaskController taskController,
  required String message,
}) async {
  await addTask(tasks);

  RouterUtil.pop();
  SnackbarUtil.show(message);
  taskController.init();
}
