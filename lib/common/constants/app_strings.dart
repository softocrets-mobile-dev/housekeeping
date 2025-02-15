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
  static const String logout = "Logout";
  static const String loggingOut = "Logging Out...";
  static const String logoutConfirmation = "Logout Confirmation!";
  static const String cancel = "Cancel";
  static const String ok = "Ok";
  static const String changePassword = "Change Password";

  static const String oldPassword = "Old Password";
  static const String newPassword = "New Password";
  static const String confirmPassword = "Confirm Password";
  static const String passwordHint = "Password hint";
  static const String rememberMe = "Remember Me";
}
