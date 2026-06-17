import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/generated/assets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.sort),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.assetsImagesAppIcon, width: 30.w, height: 30.h),

          CustomTextWidget(
            text: 'Stylish',
            style: AppTextStyles.bold18.copyWith(
              fontFamily: 'Libre Caslon Text',
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 28.r,
          backgroundImage: AssetImage(Assets.assetsImagesPerson),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}