import '../../../global/extensions/failure_ext.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../../../global/utils/snackbar_util.dart';
import '../../task/controllers/task_controller.dart';
import '../controllers/new_task_controller.dart';
import '../controllers/ui/new_task_ui_controller.dart';

void updateTask(AppLocalizations appLocale) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskUIController newTaskUIController = newTaskUIProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();

  final isValid = newTaskUIController.formTaskKey!.currentState!.validate();
  if (!isValid) {
    return;
  }
  final updTask = newTaskController.state.taskToAdd;
  final result = await newTaskController.updateTask(updTask);

  result.fold(
    (failure) => failure.show(content: 'Error al actualizar la tarea'),
    (_) {
      RouterUtil.pop();
      SnackbarUtil.show(appLocale.updateTask);

      taskController.init();
    },
  );
}
