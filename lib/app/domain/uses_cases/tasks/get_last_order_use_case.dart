import '../../repositories/task_repository.dart';

class GetLastOrderUseCase {
  GetLastOrderUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<int> call() async {
    final tasks = await _taskRepository.getTasks();
    return tasks.length + 1;
  }
}
