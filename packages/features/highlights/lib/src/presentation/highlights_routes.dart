import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:highlights/src/presentation/screens/highlights_screen.dart';

abstract final class HighlightsRoutes {
  /// Назва маршруту екрану основних моментів
  static const String highlightsScreenName = 'highlights_screen';

  /// Путь маршруту екрану основних моментів
  static const String _highlightsScreenPath = '/highlights';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: _highlightsScreenPath,
    observers: observers,
    routes: [
      ...routes,
      GoRoute(
        path: _highlightsScreenPath,
        name: highlightsScreenName,
        builder: (context, state) => const HighlightsScreen(),
      ),
    ],
  );
}
