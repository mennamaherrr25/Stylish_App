import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.model});
  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            fit: BoxFit.contain,
            width: 300.w,
            height: 300.h,
          ),
          SizedBox(height: 32.h),

          CustomTextWidget(
            text: model.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.extraBold24.copyWith(
              color: AppColors.blackText,
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextWidget(
            text: model.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold14.copyWith(color: AppColors.greyText),
          ),

          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
