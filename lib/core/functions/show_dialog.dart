import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.primaryColor),
          SizedBox(width: 8.w),
          Text('Oops!', style: AppTextStyles.semiBold18),
        ],
      ),
      content: Text(message, style: AppTextStyles.regular14),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Try Again',
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
