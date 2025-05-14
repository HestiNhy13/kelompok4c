import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Function(String)? onChanged;

  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;

  // Tambahan untuk styling opsional
  final Color? textColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? fillColor;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.textAlign,
    this.style,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.textColor,
    this.hintColor,
    this.borderColor,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText,
      style: style ?? TextStyle(color: textColor ?? Colors.black),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor ?? Colors.grey),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        counterText: "", // hide maxLength counter, cocok buat OTP
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: borderColor ?? Colors.grey,
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
