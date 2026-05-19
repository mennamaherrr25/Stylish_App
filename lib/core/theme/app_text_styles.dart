import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle bold40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold36 = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle semiBold34 = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
  );

  static TextStyle extraBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
  );
  static TextStyle semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
    fontFamily: 'Montserrat',
  );

  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle semiBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
}