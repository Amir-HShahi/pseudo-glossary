import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String _isDataInitialized = 'isDataInitialized';

  static Future<bool> isDataInitialized() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDataInitialized) ?? false;
  }

  static Future<void> setDataAsInitialized(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDataInitialized, value);
  }
}