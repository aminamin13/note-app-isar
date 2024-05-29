import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
  ), // ColorScheme.light
); // ThemeData
// dark mode
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
  ), // ColorScheme.dark
); // ThemeData


//or

// class ThemeProvider with ChangeNotifier {
// // initially, theme is light mode
// ThemeData _themeData = lightMode;
// // getter method to access the theme from other parts of the code
// ThemeData get themeData => _themeData;
// // getter method to see if we are in dark mode or not
// bool get isDarkMode => _themeData == darkMode;
// // setter method to set the new theme
// set themeData (ThemeData themeData) {
// _themeData = themeData;
// notifyListeners();
// }
// // we will use this toggle in a switch later on..
// void toggleTheme () {
// if (_themeData == lightMode) {
// themeData = darkMode;
// } else {
// themeData=lightMode;
// }
// }
// }