import 'package:flutter/material.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.isPassword = false,
    this.obscureText = false,
  });

  final Widget hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool isPassword;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autofocus: autofocus,
      validator: validator,
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hint: hint,
        suffixIcon: suffixIcon,
        fillColor: AppColors.searchFillColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.navUnselectedColor),
        ),
      ),
    );
  }
}
