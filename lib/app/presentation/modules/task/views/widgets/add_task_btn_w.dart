import 'package:flutter/material.dart';

import '../../../../global/utils/router_util.dart';
import '../../../../router/app_routes/new_task_route.dart';

class AddTaskBtnW extends StatelessWidget {
  const AddTaskBtnW({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () => RouterUtil.push(NewTaskRoute.path),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primaryColor.withValues(alpha: 0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, color: primaryColor),
      ),
    );
  }
}
