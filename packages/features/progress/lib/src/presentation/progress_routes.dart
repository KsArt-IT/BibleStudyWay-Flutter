import 'package:go_router/go_router.dart';
import 'package:progress/src/presentation/screens/progress_screen.dart';

/// {@template ProgressRoutes}
/// Роути для екрану прогресу
/// {@endtemplate}
abstract final class ProgressRoutes {
  /// Назва маршруту
  static const String progressScreenName = 'progress_screen';

  /// Путь маршруту
  static const String _progressScreenPath = '/progress';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static GoRoute buildRoutes({List<RouteBase> routes = const []}) => GoRoute(
    path: _progressScreenPath,
    name: progressScreenName,
    builder: (context, state) => const ProgressScreen(),
    routes: [if (routes.isNotEmpty) ...routes],
  );
}
