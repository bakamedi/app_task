import 'package:flutter/material.dart';

import '../../../../global/extensions/responsive_num_ext.dart';
import '../../../../global/utils/l10n_util.dart';
import '../../controller/task_writing_controller.dart';

class TextInputTitleW extends StatelessWidget {
  const TextInputTitleW({super.key, required this.taskWritingController});

  final TaskWritingController taskWritingController;

  @override
  Widget build(BuildContext context) {
    final appLocale = L10nUtil.t;

    return TextField(
      onChanged: taskWritingController.onTitleChanged,
      decoration: InputDecoration(
        hintText: appLocale.writeTitleHere,
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 20.sp, fontWeight: .bold),
      ),
      style: TextStyle(fontSize: 2.2.sp, fontWeight: .bold),
    );
  }
}
