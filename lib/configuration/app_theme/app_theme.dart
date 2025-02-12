import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/size_config/size_config.dart';

class AppTheme {
  static _border([
    Color color = AppColors.borderColor,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      surfaceTintColor: AppColors.transparentColor,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 24.r,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(15.r),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.blackColor),
      errorBorder: _border(AppColors.blackColor),
      focusedErrorBorder: _border(AppColors.blackColor),
      hintStyle: TextStyle(
        color: AppColors.greyColor,
        fontSize: 16.sp,
      ),
      errorStyle: TextStyle(
        color: AppColors.redColor,
        fontSize: 16.sp,
      ),
      helperStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.sp,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
      size: 24.r,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      contentTextStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
      linearMinHeight: 10.r,
    ),
  );
}
