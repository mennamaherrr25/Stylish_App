import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_text_styles.dart';
import 'package:stylish_app/core/widgets/custom_text_widget.dart';
import 'package:stylish_app/features/home/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, this.onTap});

  final CategoryModel category;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          // Color of the ripple effect when the user taps
          splashColor: Colors.black.withOpacity(0.1),
          // Color shown while the user is pressing down on the widget
          highlightColor: Colors.black.withOpacity(0.05),
          onTap: onTap,
          child: Column(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundImage: NetworkImage(category.image),
              ),

              SizedBox(height: 4.h),

              SizedBox(
                width: 70.w,
                child: CustomTextWidget(
                  text: category.name,
                  style: AppTextStyles.regular12,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
