import 'package:flutter/material.dart';

import '../../extensions/responsive_num_ext.dart';

class TitleGW extends StatelessWidget {
  const TitleGW({super.key, required this.title, this.size});

  final String title;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final fontSize = size ?? 25.sp;

    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: .bold),
    );
  }
}
