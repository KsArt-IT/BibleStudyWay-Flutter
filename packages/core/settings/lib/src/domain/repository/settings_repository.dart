import 'package:core_common/common.dart';
import 'package:core_settings/src/domain/models/app_settings.dart';

/// {@template settings_repository}
/// Інтерфейс для роботи з налаштуваннями приложения
/// {@endtemplate}
abstract interface class SettingsRepository with DiBaseRepo {
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
