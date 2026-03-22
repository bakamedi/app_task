import '../defs/type_defs.dart';
import '../models/failures/failure.dart';
import '../models/task/task_model.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  FutureEither<Failure, List<Task>> getTasks();
  Future<Task?> getTaskById(String taskId);
}
