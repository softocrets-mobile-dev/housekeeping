class LocalStorageConstants {
  //Singleton factory
  factory LocalStorageConstants() {
    return _singleton;
  }

  static final LocalStorageConstants _singleton =
      LocalStorageConstants._internal();

  LocalStorageConstants._internal();

  static const String isUserLoggedIn = "IS_USER_LOGGED_IN";
  static const String authToken = "AUTH_TOKEN";
  static const String tenantId = "TENANT_ID";
  static const String hotelName = "HOTEL_NAME";
  static const String userEmail = "USER_EMAIL";
  static const String userProfile = "USER_PROFILE";
  static const String role = "ROLE";
  static const String userName = "USER_NAME";
  static const String userId = "USER_ID";
  static const String isRememberMe = "IS_REMEMBER_ME";
}
