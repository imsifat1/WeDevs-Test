import 'package:flutter/material.dart';

final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

class AppThemeNotifier extends ChangeNotifier {

  static bool isDarkModeOn = false;

  static void toggleTheme() {
    isDarkModeOn = !isDarkModeOn;
    themeMode.value = isDarkModeOn ? ThemeMode.dark : ThemeMode.light;
  }

  static void setTheme(Brightness brightness) {
    isDarkModeOn = brightness == Brightness.dark;
    themeMode.value = isDarkModeOn ? ThemeMode.dark : ThemeMode.light;
  }
}