import '../controller/task_writing_controller.dart';

void onEraseAll() {
  final taskWritingController = taskWritingProvider.read();
  taskWritingController.onDelete();
}
