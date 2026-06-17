import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:stylish_app/core/theme/app_colors.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/home/presentation/widgets/white_border_button.dart';

class DealOfDayCard extends StatelessWidget {
  const DealOfDayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.secondaryColor,
      ),
      child: ListTile(
        title: Row(
          children: [
            CustomTextWidget(
              text: 'Deal of the Day',
              style: AppTextStyles.medium16.copyWith(
                color: AppColors.lightText,
              ),
            ),
            Spacer(flex: 1),
            WhiteBorderButton(text: 'View All', onPressed: () {  },),
          ],
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedClock04,
              color: AppColors.lightText,
              size: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.r),
              child: CustomTextWidget(
                text: '22h 55m 20s remaining ',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}