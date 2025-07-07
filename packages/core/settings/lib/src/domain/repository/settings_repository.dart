import 'package:core_settings/src/domain/models/app_settings.dart';

/// {@template settings_repository}
/// Інтерфейс для роботи з налаштуваннями приложения
/// {@endtemplate}
abstract interface class SettingsRepository {
  /// Найменування інтерфейсу
  static const name = 'SettingsRepository';

  /// Завантаження налаштувань
  Future<AppSettings> loadSettings();

  /// Завантаження теми
  Future<bool?> loadTheme();

  /// Завантаження мови
  Future<String?> loadLocale();

  /// Збереження теми
  Future<void> saveTheme(bool? isDark);

  /// Збереження мови
  Future<void> saveLocale(String? localeCode);
}
