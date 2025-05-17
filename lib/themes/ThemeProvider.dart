// theme_provider.dart
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _themeLabel = 'light';

  ThemeMode get themeMode => _themeMode;
  String get themeLabel => _themeLabel;

  void toggleTheme(String label) {
    _themeLabel = label;
    if (label == 'dark') {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;
}
