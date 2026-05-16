import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';

class AuthIntro extends StatelessWidget {
  const AuthIntro({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 43.h, bottom: 32.h),
          child: CustomTextWidget(
            text: text,
            textAlign: TextAlign.left,
            style: AppTextStyles.bold40.copyWith(color: AppColors.blackText),
          ),
        ),
      ],
    );
  }
}
