import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'dark_theme_preference.dart';

class ThemeController extends GetxController {
  final RxBool _darkTheme = false.obs;
  bool get darkTheme => _darkTheme.value;

  void setDarkTheme(bool value) {
    _darkTheme.value = value;
    _saveThemeToPrefs(value);
    update();
  }

  void _saveThemeToPrefs(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DarkThemePrefs.THEME_STATUS, value);
  }

  Future<void> loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkTheme = prefs.getBool(DarkThemePrefs.THEME_STATUS) ?? false;
    setDarkTheme(darkTheme);
  }
}
