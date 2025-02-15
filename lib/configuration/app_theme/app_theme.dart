import 'package:flutter/material.dart';
import 'package:housekeeping_pro/configuration/app_colors/app_colors.dart';
import 'package:housekeeping_pro/configuration/app_theme/extension/image_theme_data_extension.dart';

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
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      elevation: 0,
      surfaceTintColor: AppColors.transparentColor,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      fillColor: AppColors.textFieldBgColor,
      filled: true,
      labelStyle: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide.none,
      ),
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
      backgroundColor: /*AppColors.whiteColor*/ /*Colors.grey[850]*/
          Colors.blueGrey[900],
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      contentTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
      linearMinHeight: 10,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: darkTextTheme(),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.whiteColor),
      checkColor: WidgetStateProperty.all(AppColors.blackColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.blackColor,
        minimumSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.blackColor,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    extensions: [
      ImageThemeDataExtension(
        color: AppColors.whiteColor,
      ),
    ],
  );

  static final lightThemeMode = ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
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
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      fillColor: AppColors.textFieldBgColor,
      filled: true,
      labelStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: BorderSide.none,
      ),
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
      color: AppColors.blackColor,
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
      color: AppColors.blackColor,
      linearMinHeight: 10,
    ),
    //5F60B9
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightButtonColor,
        foregroundColor: AppColors.whiteColor,
        minimumSize: Size(double.infinity, 50),
        textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16,
          color: AppColors.blackColor,
          fontWeight: FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: lightTheme(),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColors.blackColor),
      checkColor: WidgetStateProperty.all(AppColors.whiteColor),
    ),
    extensions: [
      ImageThemeDataExtension(
        color: AppColors.blackColor,
      ),
    ],
  );
}

TextTheme darkTextTheme() => TextTheme(
      displayLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 57, // Default: 57
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 45, // Default: 45
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 36, // Default: 36
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 32, // Default: 32
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 28, // Default: 28
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24, // Default: 24
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22, // Default: 22
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16, // Default: 16
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16, // Default: 16
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 12, // Default: 12
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 12, // Default: 12
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 11, // Default: 11
        fontWeight: FontWeight.w500,
      ),
    );

TextTheme lightTheme() => TextTheme(
      displayLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 57, // Default: 57
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 45, // Default: 45
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 36, // Default: 36
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 32, // Default: 32
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 28, // Default: 28
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 24, // Default: 24
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 22, // Default: 22
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16, // Default: 16
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16, // Default: 16
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12, // Default: 12
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: AppColors.blackColor,
        fontSize: 14, // Default: 14
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 12, // Default: 12
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 11, // Default: 11
        fontWeight: FontWeight.w500,
      ),
    );
