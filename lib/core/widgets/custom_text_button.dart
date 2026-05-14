import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.widget,
    this.style,
  });

  final void Function()? onPressed;
  final Widget widget;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, style: style, child: widget);
  }
}
