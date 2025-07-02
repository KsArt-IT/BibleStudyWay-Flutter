import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lectures/src/presentation/screens/lectures_screen.dart';

abstract final class LecturesRoutes {
  /// Назва маршруту екрану лекцій
  static const String lecturesScreenName = 'lectures_screen';

  /// Путь маршруту екрану лекцій
  static const String _lecturesScreenPath = '/lectures';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: _lecturesScreenPath,
    observers: observers,
    routes: [
      ...routes,
      GoRoute(
        path: _lecturesScreenPath,
        name: lecturesScreenName,
        builder: (context, state) => const LecturesScreen(),
      ),
    ],
  );
}
