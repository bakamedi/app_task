import 'package:flutter/material.dart';

import '../../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../global/l10n_gen/generated/s.dart';
import '../../controller/task_writing_controller.dart';

class TextInputTitleW extends StatelessWidget {
  const TextInputTitleW({super.key, required this.taskWritingController});

  final TaskWritingController taskWritingController;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context);
    final adaptativeScreen = AdaptativeScreen(context);

    return TextField(
      onChanged: taskWritingController.onTitleChanged,
      decoration: InputDecoration(
        hintText: appLocale.writeTitleHere,
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: adaptativeScreen.dp(2.2),
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        fontSize: adaptativeScreen.dp(2.2),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
