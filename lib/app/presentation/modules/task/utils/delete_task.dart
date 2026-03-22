import '../../../../domain/models/task/task_model.dart';
import '../../../global/extensions/failure_ext.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/snackbar_util.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void deleteTask(Task task, {required AppLocalizations appLocale}) async {
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
