import 'package:flutter/material.dart';
import 'package:flutter_meedu/providers.dart';

import 'package:go_router/go_router.dart';
import 'app_routes/task_route.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(initialLocation: TaskRoute.path, routes: [TaskRoute.route]),
);
