import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/features/auth/widgets/social_icon_button.dart';
import 'package:stylish_app/generated/assets.dart';

class SocialIconButtonsRow extends StatelessWidget {
  const SocialIconButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SocialIconButton(icon: Assets.assetsIconsGoogleIcon),
          SocialIconButton(icon: Assets.assetsIconsAppleIcon),
          SocialIconButton(icon: Assets.assetsIconsFacebookIcon),
        ],
      ),
    );
  }
}
