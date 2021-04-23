import 'package:shared_preferences/shared_preferences.dart';

class helperFunction {
  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "USERNAME";
  static String sharedPreferencesUserEmailKey = "USEREMAIL";

  static Future<void> saveUserLoggedInSP(bool isUserLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setBool(sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveUserNameSP(String userName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(sharedPreferencesUserNameKey, userName);
  }
}
