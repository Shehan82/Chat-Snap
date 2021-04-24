import 'package:shared_preferences/shared_preferences.dart';

class helperFunctions {
  static String sharedPreferencesUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferencesUserNameKey = "USERNAME";
  static String sharedPreferencesUserEmailKey = "USEREMAIL";

  static Future<void> saveUserLoggedInSP(bool isUserLoggedIn) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setBool(sharedPreferencesUserLoggedInKey, isUserLoggedIn);
  }

  static Future<void> saveUserNameSP(String userName) async {
    print("save userName");
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(sharedPreferencesUserNameKey, userName);
  }

  static Future<void> saveUserEmailSP(String userEmail) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setString(sharedPreferencesUserEmailKey, userEmail);
  }

  // get shared preferences

  static Future<bool> getUserLoggedInSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(sharedPreferencesUserLoggedInKey);
  }

  static Future<String> getUserNameSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(sharedPreferencesUserNameKey);
  }

  static Future<String> getUserEmailSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(sharedPreferencesUserEmailKey);
  }
}
