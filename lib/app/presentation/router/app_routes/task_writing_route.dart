import 'package:go_router/go_router.dart';

import '../../modules/task_writing/view/task_writing_view.dart';

class TaskWritingRoute {
  static const path = '/task-writing';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, _) {
        return const TaskWritingView();
      },
    );
  }
}
