import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_action_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class ProductControlBar extends StatelessWidget {
  const ProductControlBar({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextWidget(
          text: text,
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.blackText),
        ),
        CustomActionButton(
          text: 'Sort',
          icon: HugeIcons.strokeRoundedArrowUpDown,
        ),
        CustomActionButton(text: 'Filter', icon: HugeIcons.strokeRoundedFilter),
      ],
    );
  }
}

