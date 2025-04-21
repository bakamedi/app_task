import 'package:flutter/material.dart';

class TitleGW extends StatelessWidget {
  const TitleGW({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
