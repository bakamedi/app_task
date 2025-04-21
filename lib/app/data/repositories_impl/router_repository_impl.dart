import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/repositories/router_repository.dart';

class RouterRepositoryImpl implements RouterRepository {
  late GoRouter _router;

  void setRouter(GoRouter router) {
    _router = router;
  }

  @override
  BuildContext get context =>
      _router.routerDelegate.navigatorKey.currentContext!;

  @override
  void push(String route, {Object? extra}) {
    _router.push(route, extra: extra);
  }

  @override
  void go(String route, {Object? extra}) {
    _router.go(route, extra: extra);
  }

  @override
  void pop() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
}
