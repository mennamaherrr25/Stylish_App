import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_app/core/routing/app_routes.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/home/presentation/widgets/white_border_button.dart';
import 'package:stylish_app/generated/assets.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Image.asset(Assets.assetsImagesAddpic),
        ),
        Positioned(
          child:
              //
              Padding(
                padding: EdgeInsets.all(20.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: '50-40% OFF',
                      style: AppTextStyles.bold24.copyWith(
                        color: AppColors.dividerColor,
                      ),
                    ),
                    //
                    SizedBox(height: 4.h),

                    CustomTextWidget(
                      text: 'Now in (product)\nAll colours',
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.lightText,
                      ),
                    ),

                    SizedBox(height: 16.h),
                    WhiteBorderButton(
                      text: 'Shop Now',
                      onPressed: () => context.push(AppRoutes.productsView),
                    ),
                  ],
                ),
              ),

          //
        ),
      ],
    );
  }
}
