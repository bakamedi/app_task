import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../../global/utils/router_util.dart';
import '../../../../router/app_routes/new_task_route.dart';
import '../../../../router/app_routes/task_writing_route.dart';

class ExpandedCreateFabW extends StatelessWidget {
  const ExpandedCreateFabW({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final colorScheme = Theme.of(context).colorScheme;

    return ExpandableFab(
      type: ExpandableFabType.fan,
      childrenAnimation: ExpandableFabAnimation.rotate,
      distance: 70,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.menu),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        size: 56,
        builder:
            (
              BuildContext context,
              void Function()? onPressed,
              Animation<double> progress,
            ) {
              return InkWell(
                onTap: onPressed,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: primaryColor),
                ),
              );
            },
      ),
      children: [
        FloatingActionButton.small(
          heroTag: null,
          child: const Icon(Icons.add),
          onPressed: () => RouterUtil.push(NewTaskRoute.path),
        ),
        FloatingActionButton.small(
          heroTag: null,
          child: const Icon(Icons.draw),
          onPressed: () => RouterUtil.push(TaskWritingRoute.path),
        ),
      ],
    );
  }
}
