import 'package:flutter/material.dart';

class ThemeStore extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void toggleDark() {
    _themeData = ThemeData.dark();
    notifyListeners();
  }

  void toggleLight() {
    _themeData = ThemeData.light();
    notifyListeners();
  }
}
