import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({super.key, required this.text, required this.icon});
  final String text;
  //final  HugeIcons icon;
  final List<List<dynamic>> icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: CustomTextWidget(text: text, style: AppTextStyles.regular12),
          ),
          HugeIcon(icon: icon, size: 20),
        ],
      ),
    );
  }
}
