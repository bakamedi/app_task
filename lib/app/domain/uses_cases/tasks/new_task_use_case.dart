import '../../models/task/task_model.dart';
import '../../repositories/task_repository.dart';

class NewTaskUseCase {
  NewTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<void> call(Task task) async {
    print(task);
    await _taskRepository.addTask(task);
  }
}
