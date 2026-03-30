import 'package:flutter/material.dart';

class ErrorGW extends StatelessWidget {
  const ErrorGW({super.key, this.error});
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            error ?? 'Error obteniendo la data inicial',
            style: const TextStyle(fontSize: 15),
          ),

          Icon(Icons.close, color: Colors.red, size: 40),
        ],
      ),
    );
  }
}
