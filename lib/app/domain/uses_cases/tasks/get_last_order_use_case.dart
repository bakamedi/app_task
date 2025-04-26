import '../../models/task/task_model.dart';
import '../../repositories/task_repository.dart';

class GetLastOrderUseCase {
  GetLastOrderUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<int> call(Task task) async {
    final tasks = await _taskRepository.getTasks();
    tasks.sort((a, b) => a.order.compareTo(b.order));
    final lastOrder = tasks.isNotEmpty ? tasks.last.order + 1 : 1;
    return lastOrder;
  }
}
