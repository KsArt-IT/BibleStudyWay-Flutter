import 'package:flutter/material.dart';

/// {@template theme_notifier}
/// Клас для управління темою у додатку.
///
/// Відповідає за:
/// - Зберігання поточного режиму теми (світла/темна/системна)
/// - Повідомлення подпісників про зміни теми
/// - Перемикання між режимами теми
/// {@endtemplate}
final class ThemeNotifier extends ChangeNotifier {
  /// {@macro theme_notifier}
  ThemeNotifier();

  /// Поточний режим теми у додатку
  /// За замовчуванням використовується системна тема
  ThemeMode _themeMode = ThemeMode.system;

  /// Отримання поточного режиму теми
  ThemeMode get themeMode => _themeMode;

  /// Метод для перемикання теми у додатку.
  ///
  /// Перемикає між світлою та темною темою.
  /// Якщо поточна тема світла, перемикає на темну та навпаки.
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  /// Метод для встановлення теми у додатку.
  ///
  /// Встановлює системну, або темну чи світлу тему.
  /// Без параметрів використовується системна тему.
  void changeTheme({bool? darkMode}) {
    _themeMode = darkMode != null
        ? darkMode
              ? ThemeMode.dark
              : ThemeMode.light
        : ThemeMode.system;
    notifyListeners();
  }
}
