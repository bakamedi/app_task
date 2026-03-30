import 'package:flutter/material.dart';

import '../../../../global/extensions/widgets_ext.dart';
import '../../../../global/utils/l10n_util.dart';
import '../../../../global/validators/task_validators.dart';
import '../../../../global/widgets/btns/primary_btn.dart';
import '../../../../global/widgets/inputs/input_text_gw.dart';
import '../../controllers/new_task_controller.dart';
import '../../controllers/ui/new_task_ui_controller.dart';
import '../../utils/add_task.dart';
import '../../utils/update_task.dart';

class NewTaskFormW extends StatelessWidget {
  const NewTaskFormW({
    super.key,
    required this.newTaskController,
    required this.newTaskUIController,
  });
  final NewTaskController newTaskController;
  final NewTaskUIController newTaskUIController;

  @override
  Widget build(BuildContext context) {
    final appLocale = L10nUtil.t;

    return Form(
      key: newTaskUIController.formTaskKey,
      autovalidateMode: .onUserInteraction,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          InputTextFieldGW(
            onChanged: newTaskController.onChangeTitle,
            initialValue: newTaskController.state.taskToAdd.title,
            labelTxt: '',
            backgroundLabel: L10nUtil.t.taskTitle,
            margin: .only(top: 20),
            padding: .symmetric(horizontal: 16),
            textAlign: .start,
            maxLines: 1,
            textInputAction: .next,
            keyboardType: .text,
            obscureText: false,
            readOnly: false,
            enabled: true,
            validator: TaskValidators.validateTitle,
          ),
          InputTextFieldGW(
            onChanged: newTaskController.onChangeDescription,
            initialValue: newTaskController.state.taskToAdd.description,
            labelTxt: '',
            backgroundLabel: L10nUtil.t.taskDescription,
            margin: .only(top: 20),
            padding: .symmetric(horizontal: 16),
            textAlign: .start,
            maxLines: 3,
            textInputAction: .done,
            keyboardType: TextInputType.multiline,
            obscureText: false,
            readOnly: false,
            enabled: true,
            validator: TaskValidators.validateDescription,
          ),
          1.h.expanded,
          PrimaryButton(
            onPressed: newTaskController.hasTask
                ? () => updateTask()
                : () => addTask(),
            padding: .only(bottom: 50),
            label: newTaskController.hasTask
                ? appLocale.editTask
                : appLocale.addTask,
          ),
        ],
      ),
    ).padding(.only(left: 15, right: 15));
  }
}
