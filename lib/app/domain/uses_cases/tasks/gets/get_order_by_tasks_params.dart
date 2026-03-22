import '../../../models/task/task_model.dart';

class GetOrderByTasksParams {
  GetOrderByTasksParams({required this.taskToAdd, required this.currentTasks});
  final Task taskToAdd;
  final List<Task> currentTasks;
}
