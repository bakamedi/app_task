import 'package:flutter/material.dart';

class TitleHeaderW extends StatelessWidget {
  const TitleHeaderW({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding + 10, left: 16, right: 16),
      child: Text(
        'My Task',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
