import 'package:go_router/go_router.dart';
import '../../modules/task/views/task_view.dart';
import '../transitions/transitions.dart';

class TaskRoute {
  static const path = '/task';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        return TaskView();
      },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const TaskView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleFromCenterTransition(
              animation: animation,
              child: child,
            );
          },
        );
      },
    );
  }
}
