import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.widget,
  });

  final void Function()? onPressed;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: widget);
  }
}
