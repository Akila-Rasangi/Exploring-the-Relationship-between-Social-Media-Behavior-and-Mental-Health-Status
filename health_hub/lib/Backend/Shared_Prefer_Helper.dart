import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static Future<void> setLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", isLoggedIn);
  }

  static Future<bool> getLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  static Future<void> setAgreedToTerms(bool agreed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("agreedToTerms", agreed);
  }

  static Future<bool> getAgreedToTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("agreedToTerms") ?? false;
  }
}
