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
}
