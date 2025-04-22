import '../../models/task/task_model.dart';
import '../../repositories/task_repository.dart';

class GetTasksUseCase {
  GetTasksUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<List<Task>> call({bool completed = false}) async {
    return await _taskRepository.getTasks(completed: completed);
  }
}
