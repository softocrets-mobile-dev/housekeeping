import 'package:housekeeping_pro/storage/local_storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorageConstants constants = LocalStorageConstants();

  LocalStorage._internal();

  static Future<SharedPreferences>? _sharedPreference;

  static final LocalStorage _singleton = LocalStorage._internal();

  static LocalStorage getInstance() {
    _sharedPreference ??= SharedPreferences.getInstance();
    return _singleton;
  }

  ///Get String value
  Future<String> getString({
    required String key,
  }) async {
    return _sharedPreference!.then((preference) {
      return preference.getString(key) ?? '';
    });
  }

  ///Get Boolean value
  Future<bool> getBool({
    required String key,
  }) async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(key) ?? false;
    });
  }

  ///Get Int value
  Future<int> getInt({
    required String key,
  }) async {
    return _sharedPreference!.then((preference) {
      return preference.getInt(key) ?? 0;
    });
  }

  /// Save String Value
  Future<void> saveString({
    required String key,
    String value = '',
  }) async {
    return _sharedPreference!.then((preference) {
      preference.setString(key, value);
    });
  }

  /// Save Boolean Value
  Future<void> saveBoolean({
    required String key,
    bool value = false,
  }) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(key, value);
    });
  }

  /// Save int Value
  Future<void> saveInt({
    required String key,
    int value = 0,
  }) async {
    return _sharedPreference!.then((preference) {
      preference.setInt(key, value);
    });
  }

  /// Clear all data
  Future<void> clearAll() async {
    return _sharedPreference!.then((preference) {
      preference.clear();
    });
  }
}
