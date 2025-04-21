import 'package:flutter/material.dart';

import '../../../global/widgets/inputs/input_text_gw.dart';
import '../../../global/widgets/titles/title_gw.dart';

class NewTaskView extends StatelessWidget {
  const NewTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            TitleGW(title: 'New Task'),
            InputTextFieldGW(
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
            ),
            InputTextFieldGW(
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
            ),
          ],
        ),
      ),
    );
  }
}
