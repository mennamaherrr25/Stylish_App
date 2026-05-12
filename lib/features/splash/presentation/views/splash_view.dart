import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/constants/app_constants.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/generated/assets.dart';
import 'package:stylish_app/core/routing/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      context.go(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.assetsImagesAppIcon,
              width: 124.w,
              height: 100.w,
            ),
            SizedBox(width: 6.w),
            CustomTextWidget(
              text: AppConstants.appTitle,
              style: AppTextStyles.bold40.copyWith(
                color: AppColors.primaryColor,
                fontFamily: 'Libre Caslon Text',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
