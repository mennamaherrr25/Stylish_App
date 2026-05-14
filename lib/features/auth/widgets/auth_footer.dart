import 'package:flutter/material.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: 'Create An Account?',
          style: AppTextStyles.regular12.copyWith(color: AppColors.greyText),
        ),
        CustomTextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            textStyle: const TextStyle(decoration: TextDecoration.underline),
          ),
          widget: CustomTextWidget(
            text: 'Sign Up',
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}