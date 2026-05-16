import 'package:flutter/material.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });

  final String text;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: text,
          style: AppTextStyles.regular12.copyWith(color: AppColors.greyText),
        ),
        CustomTextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            textStyle: const TextStyle(decoration: TextDecoration.underline),
          ),
          widget: CustomTextWidget(
            text: textButton,
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
