import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static Future<void> recordLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login_time', DateTime.now().toIso8601String());
  }

  static Future<void> recordLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('logout_time', DateTime.now().toIso8601String());
  }
}
