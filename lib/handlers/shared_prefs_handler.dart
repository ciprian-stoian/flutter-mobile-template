import 'package:fluttermobiletemplate/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHandler {
  static void setUsername(String clientId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USERNAME_KEY, clientId);
  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USERNAME_KEY);
  }
}
