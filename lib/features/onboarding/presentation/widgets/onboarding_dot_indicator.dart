import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

class OnboardingDotIndicator extends StatelessWidget {
  const OnboardingDotIndicator({
    super.key,
    required this.currentPage,
    required this.pagesCount,
  });

  final int currentPage;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        pagesCount,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: index == currentPage ? 24.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: index == currentPage
                ? AppColors.blackText
                : AppColors.lightGreyText,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }
}
