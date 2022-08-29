import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static initStatus(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return true;
    } else {
      return false;
    }
  }

  static statusLang() async {
    return await initStatus('lang');
  }

  static initSet(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    return true;
  }

  static setLang(String value) async {
    return await initSet('lang', value);
  }

  static initGet(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static getLang() async {
    return await initGet('lang');
  }
}
