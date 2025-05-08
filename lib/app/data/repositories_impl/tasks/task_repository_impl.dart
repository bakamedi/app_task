import '../../../domain/models/task/task_model.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../source/providers/tasks/task_provider.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required TaskProvider taskProvider})
    : _taskProvider = taskProvider;
  final TaskProvider _taskProvider;
  @override
  Future<void> addTask(Task task) async {
    await _taskProvider.addTask(task);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _taskProvider.deleteTask(task);
  }

  @override
  Future<Task?> getTaskById(String taskId) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() async {
    return await _taskProvider.getTasks();
  }

  @override
  Future<void> updateTask(Task task) async {
    await _taskProvider.updateTask(task);
  }
}
