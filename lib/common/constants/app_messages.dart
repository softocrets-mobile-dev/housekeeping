class AppMessages {
  factory AppMessages() {
    return _singleton;
  }

  static final AppMessages _singleton = AppMessages._internal();

  AppMessages._internal();

  static const String txtEnterEmail = "Please enter an email";
  static const String txtInvalidEmailFormat = "Invalid email format";
  static const String txtEmailCannotContainSpaces =
      "Email cannot contain spaces";

  static const String txtEnterPassword = "Please enter a password";
  static const String txtEnterHotelName = "Please enter a hotel name";

  static const String txtInvalidRequest = "Invalid request";
  static const String txtUnauthorised = "Unauthorised";
  static const String txtForbiddenException = "Forbidden";
  static const String txtInternalServerException = "Internal server error";

  static const String logoutConfirmationMessage =
      "Are you sure you want to log out?";

//Password hint messages
//Password must contain at least:
// 1 uppercase letter (A-Z),
// 1 lowercase letter (a-z),
// 1 digit (0-9),
// 1 special character (!@#\$%^&*()),
// and be at least 8 characters long.
// Example: Example@123
  static const String txtPasswordHint = "Password must contain at least:";
  static const String txtPasswordHintUpperCase = "1 uppercase letter (A-Z),";
  static const String txtPasswordHintLowerCase = "1 lowercase letter (a-z),";
  static const String txtPasswordHintDigit = "1 digit (0-9),";
  static const String txtPasswordHintSpecialChar =
      "1 special character (!@#\$%^&*()),";
  static const String txtPasswordHintLength =
      "and be at least 8 characters long.";
  static const String txtPasswordHintExample = "Example: Example@123";

  static const String passwordChangedSuccessfully =
      "Password changed successfully.";
}
