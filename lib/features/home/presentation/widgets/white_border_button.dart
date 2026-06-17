import 'package:flutter/material.dart';

class WhiteBorderButton extends StatelessWidget {
  const WhiteBorderButton({super.key, required this.text,required this.onPressed});
  final String text;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        side: const BorderSide(color: Colors.white, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: TextStyle(fontSize: 14)),
          SizedBox(width: 4),
          Icon(Icons.arrow_forward, size: 16),
        ],
      ),
    );
  }
}