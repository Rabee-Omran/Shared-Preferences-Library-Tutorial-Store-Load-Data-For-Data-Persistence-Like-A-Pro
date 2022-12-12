import 'dart:convert';

import 'package:shared_pref_tutorial/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  static void setInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  static void setUser(User user) =>
      _sharedPreferences.setString("user", json.encode(user.toJson()));

  static String? getString(String key) => _sharedPreferences.getString(key);
  static int? getInt(String key) => _sharedPreferences.getInt(key);

  static User? getUser() {
    String? encodedUser = getString('user');
    if (encodedUser == null) {
      return null;
    } else {
      User user = User.fromJson(json.decode(encodedUser));
      return user;
    }
  }

  static Future<bool> removeUser() => _sharedPreferences.remove("user");
  static Future<bool> removeAt(String key) => _sharedPreferences.remove(key);
  static Future<bool> clearAll() => _sharedPreferences.clear();
}
