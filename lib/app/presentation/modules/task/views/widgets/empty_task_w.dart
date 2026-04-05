import 'package:flutter/material.dart';

import '../../../../global/extensions/responsive_num_ext.dart';
import '../../../../global/extensions/widgets_ext.dart';

class EmptyTaskW extends StatelessWidget {
  const EmptyTaskW({super.key});

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;

    return Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      spacing: 25,
      children: [
        Icon(
          Icons.add_task_rounded,
          size: 100.sp,
          color: outline.withValues(alpha: 0.2),
        ),
        Text(
          'There are no tasks available',
          style: TextStyle(
            color: outline.withValues(alpha: 0.2),
            fontSize: 22.sp,
          ),
        ).padding(.only(bottom: 250.rh)),
      ],
    ).center;
  }
}
