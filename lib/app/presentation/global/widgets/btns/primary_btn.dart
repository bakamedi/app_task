import 'package:flutter/material.dart';

import '../../extensions/responsive_num_ext.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.margin,
    this.padding,
    required this.label,
    this.icon,
    this.fontSize,
    this.onPressed,
  });

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String label;
  final IconData? icon;
  final double? fontSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: margin,
      padding: padding,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor, // Azul
          padding: const EdgeInsets.symmetric(vertical: 20), // Alto del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bordes redondeados
          ),
          elevation: 0, // Sin sombra
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 1.6.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
