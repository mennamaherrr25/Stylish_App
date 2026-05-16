import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    required this.style,
    this.textAlign,
  });
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign, maxLines: 3);
  }
}
