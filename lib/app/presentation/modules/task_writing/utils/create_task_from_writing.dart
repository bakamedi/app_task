import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../task/controllers/task_controller.dart';
import '../controller/task_writing_controller.dart';

void createTaskFromWriting(AppLocalizations appLocale) async {
  final taskWritingController = taskWritingProvider.read();
  final taskController = taskProvider.read();
  final snackbarGC = snackbarGP.read();

  await taskWritingController.addTask(taskController.all);

  snackbarGC.show(appLocale.doneTask);
  taskController.init();
}
