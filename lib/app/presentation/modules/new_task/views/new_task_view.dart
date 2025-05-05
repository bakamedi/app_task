import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../global/extensions/widgets_ext.dart';
import '../../../global/utils/task_validators.dart';
import '../../../global/widgets/btns/primary_btn.dart';
import '../../../global/widgets/inputs/input_text_gw.dart';
import '../../../global/widgets/titles/title_gw.dart';
import '../controllers/ui/new_task_ui_controller.dart';
import '../utils/add_task.dart';
import '../controllers/new_task_controller.dart';
import '../utils/update_task.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Consumer(
          builder: (_, ref, __) {
            final newTaskController = ref.watch(newTaskProvider);
            final newTaskUIController = ref.watch(newTaskUIProvider);
            return Form(
              key: newTaskUIController.formTaskKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleGW(
                    title:
                        newTaskController.hasTask ? 'Edition Task' : 'New Task',
                  ).padding(EdgeInsets.only(left: 15, right: 15, top: 40)),
                  InputTextFieldGW(
                    onChanged: newTaskController.onChangeTitle,
                    initialValue: newTaskController.state.taskToAdd.title,
                    labelTxt: 'Task Title',
                    backgroundLabel: 'Enter task title',
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    readOnly: false,
                    enabled: true,
                    validator: TaskValidators.validateTitle,
                  ),
                  InputTextFieldGW(
                    onChanged: newTaskController.onChangeDescription,
                    initialValue: newTaskController.state.taskToAdd.description,
                    labelTxt: 'Task Description',
                    backgroundLabel: 'Enter task description',
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    obscureText: false,
                    readOnly: false,
                    enabled: true,
                    validator: TaskValidators.validateDescription,
                  ),
                  1.h.expanded,
                  PrimaryButton(
                    onPressed:
                        newTaskController.hasTask
                            ? () => updateTask()
                            : () => addTask(),
                    padding: EdgeInsets.only(bottom: 50),
                    label: newTaskController.hasTask ? 'Edit Task' : 'Add Task',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
