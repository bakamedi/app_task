import '../../../../core/success/success.dart';
import '../../../defs/type_defs.dart';
import '../../../models/failures/failure.dart';
import '../../../models/task/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../base/base_use_case.dart';

class UpdateTaskUseCase implements UseCase<Success, Task> {
  UpdateTaskUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  @override
  FutureEither<Failure, Success> call(Task task) async {
    return await _taskRepository.updateTask(task);
  }
}
