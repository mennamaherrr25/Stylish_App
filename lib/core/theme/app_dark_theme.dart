import 'package:flutter/material.dart';
import 'package:stylish_app/core/constants/app_constants.dart';
import 'package:stylish_app/core/theme/app_colors.dart';

abstract class AppDarkTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: AppConstants.appFontFamily,
    scaffoldBackgroundColor: Color(0xFF121212),
    cardColor: Color(0xFF1E1E1E),

    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: Color(0xFF1E1E1E),
      onPrimary: AppColors.whiteText,
      onSecondary: AppColors.whiteText,
      onSurface: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: AppConstants.appFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: AppColors.navSelectedColor,
      unselectedItemColor: Color(0xFF757575),
      elevation: 8,
    ),

    dividerTheme: DividerThemeData(color: Color(0xFF2C2C2C), thickness: 1),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2C2C2C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Color(0xFF757575)),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    cardTheme: CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
