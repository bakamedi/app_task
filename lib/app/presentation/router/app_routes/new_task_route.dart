import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptative_screen.dart';
import '../../modules/new_task/views/new_task_view.dart';

class NewTaskRoute {
  static const path = '/new-task';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptativeScreen = AdaptativeScreen(context);

        return NewTaskView();
      },
    );
  }
}
