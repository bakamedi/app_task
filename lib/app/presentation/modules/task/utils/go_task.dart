import '../../../../domain/models/task/task_model.dart';
import '../../../global/utils/router_util.dart';
import '../../../router/app_routes/new_task_route.dart';
import '../../new_task/controllers/new_task_controller.dart';

void goTask(Task task) {
  final NewTaskController newTaskController = newTaskProvider.read();

  newTaskController.setTaskToAdd(task);
  newTaskController.onChangeTitle(task.title);
  newTaskController.onChangeDescription(task.description);
  RouterUtil.push(NewTaskRoute.path);
}
