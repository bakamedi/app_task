import 'package:flutter/material.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';

class TitleGW extends StatelessWidget {
  const TitleGW({super.key, required this.title, this.size});

  final String title;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen.of(context);
    final fontSize = size ?? adaptativeScreen.dp(2.5);

    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
