import 'package:go_router/go_router.dart';
import '../../modules/new_task/views/new_task_view.dart';
import '../transitions/transitions.dart';

class NewTaskRoute {
  static const path = '/new-task';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        return NewTaskView();
      },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const NewTaskView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideFromBottomTransition(
              animation: animation,
              child: child,
            );
          },
        );
      },
    );
  }
}
