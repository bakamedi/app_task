import '../models/task/task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> getTasks();
  Future<Task?> getTaskById(String taskId);
}
