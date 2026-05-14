import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_field.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            prefixIcon: Icon(Icons.person, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Username or Email',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),
          SizedBox(height: 26.h),
          CustomTextFormField(
            suffixIcon: Icon(Icons.visibility, color: AppColors.greyText),
            prefixIcon: Icon(Icons.lock, color: AppColors.greyText),
            hint: CustomTextWidget(
              text: 'Password',
              style: AppTextStyles.medium12.copyWith(color: AppColors.greyText),
            ),
          ),
        ],
      ),
    );
  }
}