import 'package:flutter/material.dart';

class TitleHeaderW extends StatelessWidget {
  const TitleHeaderW({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: topPadding + 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Task',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              // acción del botón
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2), // fondo con opacidad
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
