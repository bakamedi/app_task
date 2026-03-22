import '../../../../core/either/either.dart';
import '../../../defs/type_defs.dart';
import '../../../models/failures/failure.dart';
import '../../../models/task/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../base/base_use_case.dart';
import 'get_order_by_tasks_params.dart';

class GetOrderByTasksUseCase implements UseCase<Task, GetOrderByTasksParams> {
  GetOrderByTasksUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  @override
  FutureEither<Failure, Task> call(GetOrderByTasksParams params) async {
    final taskToAdd = params.taskToAdd;
    final currentTasks = params.currentTasks;

    // 1. Reordenar tareas existentes
    final updatedTasks = currentTasks
        .map((task) => task.copyWith(order: task.order + 1))
        .toList();

    // 2. Persistir cambios respetando Either
    for (final task in updatedTasks) {
      final result = await _taskRepository.updateTask(task);

      if (result.isLeft) {
        return Either.left(result.getLeftOrNull()!);
      }
    }

    // 3. Retornar nueva task con orden 0
    final updTask = taskToAdd.copyWith(order: 0);

    return Either.right(updTask);
  }
}
