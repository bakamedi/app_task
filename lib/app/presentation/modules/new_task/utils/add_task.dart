import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';
import '../controllers/ui/new_task_ui_controller.dart';

void addTask(AppLocalizations appLocale) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskUIController newTaskUIController = newTaskUIProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();
  final SnackbarGC snackbarGC = snackbarGP.read();

  final isValid = newTaskUIController.formTaskKey!.currentState!.validate();
  if (!isValid) {
    return;
  }

  final tasks = taskController.all;

  await newTaskController.addTask(tasks);
  RouterUtil.pop();
  snackbarGC.show(appLocale.doneTask);
  taskController.init();
}
