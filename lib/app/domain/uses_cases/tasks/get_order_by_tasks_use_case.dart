import '../../models/task/task_model.dart';
import '../../repositories/task_repository.dart';

class GetOrderByTasksUseCase {
  GetOrderByTasksUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  Future<Task> call(Task taskToAdd, List<Task> currentTasks) async {
    final List<Task> updatedTasks =
        currentTasks.map((task) {
          return task.copyWith(order: task.order + 1);
        }).toList();
    for (final task in updatedTasks) {
      await _taskRepository.updateTask(task);
    }

    final Task updTask = taskToAdd.copyWith(order: 0);

    return updTask;
  }
}
