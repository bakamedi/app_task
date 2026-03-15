import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';

void addTask(AppLocalizations appLocale) async {
  final taskController = taskProvider.read();
  final newTaskController = newTaskProvider.read();
  final snackbarGC = snackbarGP.read();

  await newTaskController.addTask(taskController.all);

  snackbarGC.show(appLocale.doneTask);
  RouterUtil.pop();
  taskController.init();
}
