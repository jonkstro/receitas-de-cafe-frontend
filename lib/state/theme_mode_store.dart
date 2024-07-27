import 'package:flutter/material.dart';

class ThemeModeStore extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void toggleDark() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void toggleLight() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void toggleThemes(bool isDark) {
    if (isDark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
