/// {@template app_settings}
/// Модель налаштувань додатку
/// {@endtemplate}
final class AppSettings {
  /// Тема
  final bool? isDarkTheme;

  /// Мова
  final String? localeCode;

  /// {@macro app_settings}
  const AppSettings({required this.isDarkTheme, required this.localeCode});

  /// {@macro app_settings}
  AppSettings copyWith({bool? isDarkTheme, String? localeCode}) {
    return AppSettings(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      localeCode: localeCode ?? this.localeCode,
    );
  }
}
