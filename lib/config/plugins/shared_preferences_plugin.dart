import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPlugin {

  static Future<SharedPreferences> _getPrefs() {
    return SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _getPrefs();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getBool(key) ?? false;
  }
    
}