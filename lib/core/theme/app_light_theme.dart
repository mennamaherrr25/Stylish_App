import 'package:flutter/material.dart';
import 'package:stylish_app/core/constants/app_constants.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

class AppTheme {
  // ================= Light Theme =================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppConstants.appFontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    cardColor: AppColors.cardColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.cardColor,
      onPrimary: AppColors.whiteText,
      onSecondary: AppColors.whiteText,
      onSurface: AppColors.blackText,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.blackText),
      titleTextStyle: TextStyle(
        color: AppColors.blackText,
        fontFamily: AppConstants.appFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarColor,
      selectedItemColor: AppColors.navSelectedColor,
      unselectedItemColor: AppColors.navUnselectedColor,
      elevation: 8,
    ),

    dividerTheme: DividerThemeData(color: AppColors.dividerColor, thickness: 1),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.searchFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AppColors.greyText),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColors.cardColor,
      elevation: 2,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
