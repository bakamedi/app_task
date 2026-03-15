import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../../task/controllers/task_controller.dart';
import '../controller/task_writing_controller.dart';

void onSave(AppLocalizations appLocale) async {
  final taskWritingController = taskWritingProvider.read();

  final taskController = taskProvider.read();
  final snackbarGC = snackbarGP.read();

  final proccess = await taskWritingController.processImage();

  if (proccess == null) {
    snackbarGC.show(appLocale.errorProcessingImage);
  } else {
    final tasks = taskController.all;

    await taskWritingController.addTask(tasks);

    RouterUtil.pop();
    snackbarGC.show(appLocale.doneTask);
    taskController.init();
  }
}
