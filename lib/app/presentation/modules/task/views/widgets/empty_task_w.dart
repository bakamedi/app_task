import 'package:flutter/material.dart';

import '../../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../global/extensions/widgets_ext.dart';

class EmptyTaskW extends StatelessWidget {
  const EmptyTaskW({super.key});

  @override
  Widget build(BuildContext context) {
    final AdaptativeScreen screen = AdaptativeScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_task_rounded,
          size: screen.dp(10),
          color: Colors.grey.withValues(alpha: 0.5),
        ),
        Text(
          'There are no tasks available',
          style: TextStyle(
            color: Colors.grey.withValues(alpha: 0.5),
            fontSize: screen.dp(2),
          ),
        ).padding(EdgeInsets.only(bottom: screen.bhp(20))),
      ],
    ).center;
  }
}
