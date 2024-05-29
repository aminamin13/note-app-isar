import 'package:flutter/material.dart';
import 'package:note_app_offline/theme/theme.dart';

class ThemeController extends ChangeNotifier {
  bool _isDarkMode = false; // Initial theme mode

  bool get isDarkMode => _isDarkMode;

  ThemeData get theme => _isDarkMode ? darkMode : lightMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
