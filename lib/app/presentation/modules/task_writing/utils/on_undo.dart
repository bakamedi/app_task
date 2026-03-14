import '../controller/task_writing_controller.dart';

void onUndo() {
  final taskWritingController = taskWritingProvider.read();
  taskWritingController.onUndo();
}
