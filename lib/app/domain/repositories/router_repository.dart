import 'package:flutter/material.dart';

abstract class RouterRepository {
  void push(String route, {Object? extra});
  void go(String route, {Object? extra});
  void pop();
  BuildContext get context;
}
