import '../../../../domain/models/task/task_model.dart';
import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void deleteTask(Task task, {required AppLocalizations appLocale}) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();
  final snackbarGC = snackbarGP.read();

  await newTaskController.deleteTask(task);
  snackbarGC.show(appLocale.deleteTask);

  taskController.deleteTask(task);
}
