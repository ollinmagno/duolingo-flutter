import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  static Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key) ?? false;
  }

  static void setBool(String key, bool b) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool(key, b);
  }

  static Future<int> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 0;
  }

  static void setInt(String key, int i) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(key, i);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, s);
  }
}