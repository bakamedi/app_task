import '../../../../domain/models/task/task_model.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/snackbar_util.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void deleteTask(Task task, {required AppLocalizations appLocale}) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();

  await newTaskController.deleteTask(task);
  SnackbarUtil.show(appLocale.deleteTask);

  taskController.deleteTask(task);
}
