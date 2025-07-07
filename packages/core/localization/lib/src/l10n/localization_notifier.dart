import 'package:core_settings/settings.dart';
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
  LocalizationNotifier({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository {
    _settingsRepository.loadLocale().then((locale) {
      changeLocal(locale != null ? Locale(locale) : null);
    });
  }

  final SettingsRepository _settingsRepository;

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
    final newLocale =
        locale ?? WidgetsBinding.instance.platformDispatcher.locale;
    if (_locale != newLocale) {
      _locale = newLocale;
      _settingsRepository.saveLocale(locale?.languageCode);
      notifyListeners();
    }
  }
}
