import 'package:go_router/go_router.dart';
import '../../modules/task/views/task_view.dart';

class TaskRoute {
  static const path = '/task';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        return TaskView();
      },
    );
  }
}
