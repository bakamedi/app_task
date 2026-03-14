import '../../../global/controllers/snackbar/snackbar_gc.dart';
import '../../../global/l10n_gen/generated/s.dart';
import '../../../global/utils/router_util.dart';
import '../../task/controllers/task_controller.dart';
import '../controller/task_writing_controller.dart';

void onSave(AppLocalizations appLocale) async {
  final taskWritingController = taskWritingProvider.read();

  final taskController = taskProvider.read();
  final snackbarGC = snackbarGP.read();

  print('Starting image processing...');
  final proccess = await taskWritingController.processImage();

  if (proccess == null) {
    print('Image processing failed');
    snackbarGC.show('Hubo un error al procesar la imagen');
  } else {
    print('Image processing finished successfully');
    final tasks = taskController.all;

    print('Adding task with description: ${taskWritingController.state.taskToAdd.description}');
    await taskWritingController.addTask(tasks);

    RouterUtil.pop();
    snackbarGC.show(appLocale.doneTask);
    taskController.init();
  }
}
