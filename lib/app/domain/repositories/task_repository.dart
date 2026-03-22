import '../../core/success/success.dart';
import '../defs/type_defs.dart';
import '../models/failures/failure.dart';
import '../models/task/task_model.dart';

abstract class TaskRepository {
  FutureEither<Failure, Success> addTask(Task task);
  FutureEither<Failure, Success> updateTask(Task task);
  FutureEither<Failure, Success> deleteTask(Task task);
  FutureEither<Failure, List<Task>> getTasks();
  Future<Task?> getTaskById(String taskId);
}
