import '../../../../domain/models/task/task_model.dart';
import '../../../global/extensions/failure_ext.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../new_task/controllers/new_task_controller.dart';
import '../controllers/task_controller.dart';

void updateCompleted(Task task, {required AppLocalizations appLocale}) async {
  final TaskController taskController = taskProvider.read();
  final NewTaskController newTaskController = newTaskProvider.read();
  final updTask = task.copyWith(completed: !task.completed);
  final result = await newTaskController.updateTask(updTask);
  result.fold(
    (failure) => failure.show(content: appLocale.errorCompletingTask),
    (_) {
      taskController.onChangeCompleted(task);
    },
  );
}
