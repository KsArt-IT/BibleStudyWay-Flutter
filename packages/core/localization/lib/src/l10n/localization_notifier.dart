import 'package:flutter/material.dart';

/// {@template localization_notifier}
/// Клас для управління локалізацією у додатку.
///
/// Відповідає за:
/// - Зберігання поточної локалі додатку
/// - Повідомлення підписників про зміни мови
/// - Перемикання між мовами, що підтримуються
/// {@endtemplate}
final class LocalizationNotifier extends ChangeNotifier {
  /// {@macro localization_notifier}
  LocalizationNotifier();

  /// Поточна локаль у додатку
  Locale _locale = WidgetsBinding.instance.platformDispatcher.locale;

  /// Отримання поточної локаль у додатку
  Locale get locale => _locale;

  /// Отримання поточної мови як код мови
  String get language => locale.languageCode;

  /// Метод для зміни локалі програми.
  ///
  /// Приймає:
  /// - [locale] - нову локаль для встановлення у додатку
  ///
  /// повідомляє всіх підписників про зміну локалі.
  void changeLocal(Locale? locale) {
    _locale = locale ?? WidgetsBinding.instance.platformDispatcher.locale;
    notifyListeners();
  }
}
