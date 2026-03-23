import '../../../global/extensions/failure_ext.dart';
import '../../../global/utils/l10n_util.dart';
import '../../../global/utils/router_util.dart';
import '../../../global/utils/snackbar_util.dart';
import '../controllers/new_task_controller.dart';
import '../../task/controllers/task_controller.dart';

void addTask() async {
  final appLocale = L10nUtil.t;

  final taskController = taskProvider.read();
  final newTaskController = newTaskProvider.read();

  final result = await newTaskController.addTask(taskController.all);

  result.fold((failure) => failure.show(content: appLocale.errorCreatingTask), (
    _,
  ) {
    SnackbarUtil.show(appLocale.doneTask);
    RouterUtil.pop();
    taskController.init();
  });
}
