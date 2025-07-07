import 'package:core_settings/src/domain/models/app_settings.dart';
import 'package:core_settings/src/domain/repository/settings_repository.dart';
import 'package:core_settings/src/data/service/storage_service.dart';

/// {@template local_settings_repository}
/// Сервіс для роботи з налаштуваннями приложения
/// {@endtemplate}
final class LocalSettingsRepository implements SettingsRepository {
  /// {@macro local_settings_repository}
  LocalSettingsRepository({required StorageService storage})
    : _storageService = storage;

  final StorageService _storageService;

  /// Назва репозиторію
  static const name = 'LocalSettingsRepository';

  @override
  Future<AppSettings> loadSettings() async {
    final isDark = await _storageService.read('isDarkTheme');
    final locale = await _storageService.read('locale');
    return AppSettings(isDarkTheme: isDark, localeCode: locale);
  }

  @override
  Future<bool?> loadTheme() async {
    return _storageService.read('isDarkTheme');
  }

  @override
  Future<String?> loadLocale() async {
    return _storageService.read('locale');
  }

  @override
  Future<void> saveTheme(bool? isDark) async {
    if (isDark != null) {
      await _storageService.write('isDarkTheme', isDark);
    } else {
      await _storageService.delete('isDarkTheme');
    }
  }

  @override
  Future<void> saveLocale(String? localeCode) async {
    if (localeCode != null) {
      await _storageService.write('locale', localeCode);
    } else {
      await _storageService.delete('locale');
    }
  }
}
