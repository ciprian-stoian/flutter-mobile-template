import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHandler {
  static Future<String> getSharedPref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
