import 'package:flutter/material.dart';

import '../../../../global/extensions/responsive_num_ext.dart';
import '../../../../global/extensions/widgets_ext.dart';

class EmptyTaskW extends StatelessWidget {
  const EmptyTaskW({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .center,
      children: [
        Icon(
          Icons.add_task_rounded,
          size: 10.sp,
          color: Colors.grey.withValues(alpha: 0.5),
        ),
        Text(
          'There are no tasks available',
          style: TextStyle(
            color: Colors.grey.withValues(alpha: 0.5),
            fontSize: 2.sp,
          ),
        ).padding(.only(bottom: 20.rh)),
      ],
    ).center;
  }
}
