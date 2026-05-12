import 'package:flutter/material.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';

class OnboardingCounter extends StatelessWidget {
  const OnboardingCounter({
    super.key,
    required this.currentPage,
    required this.pagesCount,
  });

  final int currentPage;
  final int pagesCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${currentPage + 1}',
          style: AppTextStyles.semiBold18.copyWith(color: AppColors.blackText),
        ),
        Text(
          '/$pagesCount',
          style: AppTextStyles.semiBold18.copyWith(
            color: AppColors.navUnselectedColor,
          ),
        ),
      ],
    );
  }
}
