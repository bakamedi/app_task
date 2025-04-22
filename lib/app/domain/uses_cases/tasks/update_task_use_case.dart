import '../../models/task/task_model.dart';
import '../../repositories/task_repository.dart';

class UpdateTaskUseCase {
  UpdateTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<void> call(Task task) async {
    return await _taskRepository.updateTask(task);
  }
}
