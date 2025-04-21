import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/adaptative_screen/adaptative_screen.dart';

final radius = BorderRadius.circular(12.0);

class InputTextFieldGW extends StatelessWidget {
  const InputTextFieldGW({
    super.key,
    this.autofocus = false,
    this.prefixInput,
    this.suffixInput,
    this.textDirection,
    this.autovalidateMode,
    this.focusNode,
    this.obscureText = false,
    this.maxLength = 100,
    this.obscuringCharacter = '•',
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.readOnly = false,
    required this.backgroundLabel,
    this.onChanged,
    this.onTap,
    this.validator,
    this.margin,
    this.padding,
    this.enabled,
    this.onTapOutside,
    this.initialValue,
    required this.labelTxt,
  });

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool autofocus;
  final bool? enabled;
  final Widget? prefixInput;
  final Widget? suffixInput;
  final TextDirection? textDirection;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String backgroundLabel;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final bool readOnly;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onFieldSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String labelTxt;

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(context);

    return Container(
      margin: margin,
      padding: padding,
      child: TextFormField(
        onChanged: (value) {
          if (onChanged != null) onChanged!(value);
        },
        onFieldSubmitted: (value) {
          if (onFieldSubmitted != null) onFieldSubmitted!();
        },
        onTap: () {
          if (onTap != null) onTap!();
        },
        initialValue: controller == null ? initialValue : null,
        enabled: enabled,
        readOnly: readOnly,
        obscuringCharacter: obscuringCharacter,
        textAlign: textAlign,
        autofocus: autofocus,
        textDirection: textDirection,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        maxLength: maxLength,
        maxLines: maxLines,
        obscureText: obscureText ?? false,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onTapOutside: onTapOutside,
        decoration: _simpleInput(
          context,
          adaptativeScreen,
          labelTxt,
          backgroundLabel,
          prefix: prefixInput,
          suffix: suffixInput,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: adaptativeScreen.dp(1.5),
          fontWeight: FontWeight.w500,
        ),
        textInputAction: textInputAction,
        validator: (value) => validator?.call(value),
      ),
    );
  }
}

/// Diseño visual para que se vea como el input redondeado gris claro
InputDecoration _simpleInput(
  BuildContext context,
  AdaptativeScreen adaptativeScreen,
  String labelTxt,
  String hintText, {
  Widget? suffix,
  Widget? prefix,
}) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: const Color.fromARGB(216, 227, 222, 222), // fondo gris claro
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(
      color: Colors.black.withValues(alpha: 0.6),
      fontSize: adaptativeScreen.dp(1.5),
      fontWeight: FontWeight.w500,
    ),
    suffixIcon: suffix,
    prefixIcon: prefix,
    counterText: '',
    isDense: true,
  );
}
