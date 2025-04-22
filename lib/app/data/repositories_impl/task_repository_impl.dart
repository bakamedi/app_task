import '../../domain/models/task/task_model.dart';
import '../../domain/repositories/task_repository.dart';
import '../source/providers/tasks/task_provider.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl({required TaskProvider taskProvider})
    : _taskProvider = taskProvider;
  final TaskProvider _taskProvider;
  @override
  Future<void> addTask(Task task) async {
    await _taskProvider.addTask(task);
  }

  @override
  Future<void> deleteTask(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<Task?> getTaskById(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks({bool completed = false}) async {
    return await _taskProvider.getTasks(completed: completed);
  }

  @override
  Future<void> updateTask(Task task) {
    throw UnimplementedError();
  }
}
