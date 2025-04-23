import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class GlobalSlidableActionGW extends StatelessWidget {
  const GlobalSlidableActionGW({
    super.key,
    required this.iconData,
    required this.label,
    this.foregroundColor,
    required this.onPressed,
  });
  final IconData iconData;
  final String label;
  final Color? foregroundColor;
  final void Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      padding: const EdgeInsets.only(top: 16),
      autoClose: true,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onPressed: (context) => onPressed(context),
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor,
      icon: iconData,
      spacing: 2,
      label: label,
    );
  }
}
