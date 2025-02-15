import 'dart:ui';

class AppColors {
  //Singleton
  static final AppColors _instance = AppColors._internal();

  factory AppColors() => _instance;

  AppColors._internal();

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color redColor = Color(0xFFE57373);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color transparentColor = Color(0x00000000);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color textFieldBgColor = Color(0xFFEBEBEB);
  static const Color lightButtonColor = Color(0xFF5F60B9);
}
