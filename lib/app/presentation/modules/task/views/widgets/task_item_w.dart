import 'package:flutter/material.dart';

import '../../../../global/extensions/strings_ext.dart';
import '../../../../global/extensions/widgets_ext.dart';

class TaskItemW extends StatelessWidget {
  const TaskItemW({
    super.key,
    required this.title,
    required this.description,
    required this.completed,
    required this.date,
    required this.onTap,
    required this.onCheckboxTap,
    required this.order,
  });

  final String title;
  final String description;
  final bool completed;
  final String date;
  final int order;
  final VoidCallback onTap;
  final VoidCallback onCheckboxTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.08),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: completed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onChanged: (_) => onCheckboxTap(),
              activeColor: colorScheme.primary,
            ),
            12.w,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration:
                              completed ? TextDecoration.lineThrough : null,
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        date.toRelativeTime(),
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color?.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  4.h,
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium?.color?.withValues(
                        alpha: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
