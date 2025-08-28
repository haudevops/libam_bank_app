import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  static SharedPreferences? _prefs;

  // private constructor
  SharedPrefs._internal();

  // singleton instance
  factory SharedPrefs() {
    return _instance;
  }

  /// Khởi tạo, chỉ cần gọi 1 lần khi start app
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Get string
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// Set string
  Future<bool> setString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  /// Get int
  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// Set int
  Future<bool> setInt(String key, int value) async {
    return await _prefs?.setInt(key, value) ?? false;
  }

  /// Remove key
  Future<bool> remove(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  /// Clear all
  Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}
