import '../controller/task_writing_controller.dart';

void onRedo() {
  final taskWritingController = taskWritingProvider.read();
  taskWritingController.onRedo();
}
