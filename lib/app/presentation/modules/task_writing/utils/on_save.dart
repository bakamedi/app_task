import '../controller/task_writing_controller.dart';

void onSave() {
  final taskWritingController = taskWritingProvider.read();
  taskWritingController.onSave();
}
