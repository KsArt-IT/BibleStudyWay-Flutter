import 'package:core_settings/settings.dart';
import 'package:go_router/go_router.dart';

/// {@template SettingsRoutes}
/// Роути для екрану налаштувань
/// {@endtemplate}
abstract final class SettingsRoutes {
  /// Назва маршруту
  static const String settingsScreenName = 'settings_screen';

  /// Путь маршруту
  static const String _settingsScreenPath = '/settings';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static GoRoute buildRoutes({List<RouteBase> routes = const []}) => GoRoute(
    path: _settingsScreenPath,
    name: settingsScreenName,
    builder: (context, state) => const SettingsScreen(),
    routes: [if (routes.isNotEmpty) ...routes],
  );
}
