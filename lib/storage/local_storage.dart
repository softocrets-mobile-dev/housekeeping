import 'package:housekeeping_pro/storage/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? _sharedPreference;
  LocalStorageConstants constants = LocalStorageConstants();

  static final LocalStorage _instance = LocalStorage._internal();

  LocalStorage._internal() {
    if (_sharedPreference == null) {
      _initPrefs();
    }
  }

  factory LocalStorage() {
    return _instance;
  }

  Future<void> _initPrefs() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  ///Save boolean value
  Future<void> saveBool(String key, bool value) async {
    await _sharedPreference?.setBool(key, value);
  }

  ///Get boolean value
  bool getBool({required String key}) {
    return _sharedPreference?.getBool(key) ?? false;
  }

  ///Save boolean value
  Future<void> saveString(String key, String value) async {
    await _sharedPreference?.setString(key, value);
  }

  ///Get boolean value
  String getString({required String key}) {
    return _sharedPreference?.getString(key) ?? "";
  }

  ///Save boolean value
  Future<void> saveInt(String key, int value) async {
    await _sharedPreference?.setInt(key, value);
  }

  ///Get boolean value
  int getInt({required String key}) {
    return _sharedPreference?.getInt(key) ?? 0;
  }
}
