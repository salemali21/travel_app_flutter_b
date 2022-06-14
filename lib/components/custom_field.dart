import 'package:flutter/material.dart';

import 'package:travel_app/helpers/constants.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.hint,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.radius = 15,
    this.fillColor,
    this.textDirection,
    // this.textDirection = TextDirection.ltr,
    this.enabled,
    this.onTap,
    this.prefixIcon,
    this.onChanged,
    this.keyboardType,
    this.initialValue,
  }) : super(key: key);
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double radius;
  final Color? fillColor;
  final TextDirection? textDirection;
  final bool? enabled;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      enabled: enabled,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      textDirection: textDirection,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? null,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        hintText: hint,
        hintTextDirection: textDirection,
        filled: true,
        fillColor: fillColor ?? Colors.white.withOpacity(0.9),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: k_primaryColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
