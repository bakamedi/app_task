import '../../../defs/type_defs.dart';
import '../../../models/failures/failure.dart';
import '../../../models/task/task_model.dart';
import '../../../repositories/task_repository.dart';
import '../../base/base_use_case.dart';

class GetTasksUseCase implements UseCase<List<Task>, NoParams> {
  GetTasksUseCase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  final TaskRepository _taskRepository;

  @override
  FutureEither<Failure, List<Task>> call({NoParams? params}) async {
    return await _taskRepository.getTasks();
  }
}
