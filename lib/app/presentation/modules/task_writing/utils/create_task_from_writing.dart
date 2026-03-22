import '../../../global/extensions/failure_ext.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/snackbar_util.dart';
import '../../task/controllers/task_controller.dart';
import '../../../global/utils/router_util.dart';
import '../controller/task_writing_controller.dart';

void createTaskFromWriting(AppLocalizations appLocale) async {
  final taskWritingController = taskWritingProvider.read();
  final taskController = taskProvider.read();

  final result = await taskWritingController.addTask(taskController.all);
  result.fold((failure) => failure.show(content: appLocale.errorCreatingTask), (
    _,
  ) {
    SnackbarUtil.show(appLocale.doneTask);
    RouterUtil.pop();
    taskController.init();
  });
}
