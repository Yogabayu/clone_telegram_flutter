import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const PREF_KEY = "pref_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY) ?? false;
  }
}

class ThemeModel extends ChangeNotifier {
  bool? _isDark;
  ThemePreferences? _preferences;
  bool get isDark => _isDark!;

  ThemeModel() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }
  set isDark(bool value) {
    _isDark = value;
    _preferences!.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences!.getTheme();
    notifyListeners();
  }
}
