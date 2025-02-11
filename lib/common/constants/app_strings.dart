class AppStrings {
  static final AppStrings _instance = AppStrings._internal();

  factory AppStrings() {
    return _instance;
  }

  AppStrings._internal();

  static const String email = "Email";
  static const String password = "Password";
  static const String hotelName = "Hotel Name";
  static const String login = "Login";
}
