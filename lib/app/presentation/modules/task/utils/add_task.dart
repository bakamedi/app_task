import '../controllers/task_controller.dart';

void addTask() async {
  final taskController = taskProvider.read();
  final response = await taskController.addTask();
  taskController.init();
}
