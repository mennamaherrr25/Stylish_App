import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_button.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/generated/assets.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.assetsImagesGetStarted),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
                textAlign: TextAlign.center,
                text: 'You want Authentic, here you go!',
                style: AppTextStyles.semiBold34.copyWith(
                  color: AppColors.whiteText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 44),
                child: CustomTextWidget(
                  text: 'Find it here, buy it now!',
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.lightText.withValues(alpha: 80),
                  ),
                ),
              ),
              CustomButton(
                onPressed: () => context.go(AppRoutes.layout),
                text: 'Get Started',
              ),
              SizedBox(height: 44.h),
            ],
          ),
        ),
      ),
    );
  }
}
