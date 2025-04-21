import 'package:flutter/material.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:go_router/go_router.dart';

import 'router_state.dart';

final routerGP = Provider.state<RouterGC, RouterState>(
  (_) => RouterGC(RouterState.initialState),
);

class RouterGC extends StateNotifier<RouterState> {
  RouterGC(super.initialState);

  void setRouter(GoRouter router) {
    onlyUpdate(state = state.copyWith(router: router));
  }

  BuildContext get context =>
      state.router!.routerDelegate.navigatorKey.currentContext!;

  void push(String route, {Object? extra}) {
    state.router!.push(route, extra: extra);
  }

  void go(String route, {Object? extra}) {
    state.router!.go(route, extra: extra);
  }

  void pop() {
    if (state.router!.canPop()) {
      state.router!.pop();
    }
  }
}
