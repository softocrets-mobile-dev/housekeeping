import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';

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
          10,
        ),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      surfaceTintColor: AppColors.transparentColor,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(15),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.blackColor),
      errorBorder: _border(AppColors.blackColor),
      focusedErrorBorder: _border(AppColors.blackColor),
      suffixIconColor: AppColors.blackColor,
      hintStyle: TextStyle(
        color: AppColors.greyColor,
        fontSize: 16,
      ),
      errorStyle: TextStyle(
        color: AppColors.redColor,
        fontSize: 16,
      ),
      helperStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
      size: 24,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
      contentTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
      linearMinHeight: 10,
    ),
  );
}
