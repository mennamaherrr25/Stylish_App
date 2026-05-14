import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //  color: AppColors.primaryColor.withValues(alpha: .2),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.iconbutton,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor.withValues(alpha: .8),
          ),
        ),
        child: SvgPicture.asset(icon, width: 24.w, height: 24.h),
      ),
    );
  }
}