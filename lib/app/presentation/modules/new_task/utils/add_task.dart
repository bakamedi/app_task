import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../../../global/utils/snackbar_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';

void addTask(AppLocalizations appLocale) async {
  final taskController = taskProvider.read();
  final newTaskController = newTaskProvider.read();

  await newTaskController.addTask(taskController.all);

  SnackbarUtil.show(appLocale.doneTask);
  RouterUtil.pop();
  taskController.init();
}
