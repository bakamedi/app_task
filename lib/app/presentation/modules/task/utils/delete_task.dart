import '../../../../domain/models/task/task_model.dart';
import '../../../global/extensions/failure_ext.dart';
import '../../../global/utils/l10n_util.dart';
import '../../../global/utils/snackbar_util.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void deleteTask(Task task) async {
  final appLocale = L10nUtil.t;

  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();

  final result = await newTaskController.deleteTask(task);
  result.fold((failure) => failure.show(content: appLocale.errorDeletingTask), (
    _,
  ) {
    taskController.deleteTask(task);
    SnackbarUtil.show(appLocale.deleteTask);
  });
}
