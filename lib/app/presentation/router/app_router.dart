import 'package:flutter_meedu/providers.dart';

import 'package:go_router/go_router.dart';
import 'app_routes/new_task_route.dart';
import 'app_routes/splash_route.dart';
import 'app_routes/task_route.dart';
import 'app_routes/task_writing_route.dart';

class AppRouter {
  static final routerProvider = Provider(
    (ref) => GoRouter(
      initialLocation: SplashRoute.path,
      routes: [
        TaskRoute.route,
        NewTaskRoute.route,
        TaskWritingRoute.route,
        SplashRoute.route,
      ],
    ),
  );
}
