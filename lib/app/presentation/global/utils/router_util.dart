// lib/core/utils/navigation_utils.dart

import '../../router/router_provider.dart';

abstract class RouterUtil {
  static final _router = routerProvider.read();

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
