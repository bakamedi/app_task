import 'package:flutter/material.dart';

class MainScaffoldGW extends StatelessWidget {
  const MainScaffoldGW({
    super.key,
    required this.body,
    this.isEmpty = false,
    required this.emptyBody,
  });
  final Widget body;
  final bool isEmpty;
  final Widget emptyBody;

  @override
  Widget build(BuildContext context) {
    return isEmpty ? Expanded(child: emptyBody) : Expanded(child: body);
  }
}
