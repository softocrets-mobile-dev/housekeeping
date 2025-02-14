class AppIcons {
  //Singleton
  AppIcons._();

  static final AppIcons instance = AppIcons._();

  static const String _iconsPath = 'assets/icons/';
  static const String dashboard = '${_iconsPath}dashboard.svg';
  static const String inventory = '${_iconsPath}inventory.svg';
  static const String orders = '${_iconsPath}activity.svg';
  static const String password = '${_iconsPath}password.svg';
  static const String person = '${_iconsPath}person.svg';
}
