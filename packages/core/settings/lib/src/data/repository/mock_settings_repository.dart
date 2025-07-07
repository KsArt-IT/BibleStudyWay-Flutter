import 'package:core_settings/src/domain/models/app_settings.dart';
import 'package:core_settings/src/domain/repository/settings_repository.dart';

/// {@template MockSettingsRepository}
/// Mock реализация репозитория налаштувань
/// {@endtemplate}
final class MockSettingsRepository implements SettingsRepository {
  /// {@macro MockSettingsRepository}
  MockSettingsRepository();

  /// Назва репозиторію
  @override
  String get name => 'MockSettingsRepository';

  @override
  Future<AppSettings> loadSettings() async {
    return AppSettings(isDarkTheme: false, localeCode: 'en');
  }

  @override
  Future<String?> loadLocale() async {
    return null;
  }

  @override
  Future<bool?> loadTheme() async {
    return false;
  }

  @override
  Future<void> saveLocale(String? localeCode) async {
    return;
  }

  @override
  Future<void> saveTheme(bool? isDark) async {
    return;
  }
}
