// lib/core/utils/navigation_utils.dart

import 'package:go_router/go_router.dart';

import '../../router/app_router.dart';

abstract class RouterUtil {
  static GoRouter get _router => AppRouter.routerProvider.read();

  static void push(String route, {Object? extra}) {
    _router.push(route, extra: extra);
  }

  static void go(String route, {Object? extra}) {
    _router.go(route, extra: extra);
  }

  static void pop() {
    _router.pop();
  }
}
