import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:more/src/presentation/screens/more_screen.dart';

abstract final class MoreRoutes {
  /// Назва маршруту екрану додаткових функцій
  static const String moreScreenName = 'more_screen';

  /// Путь маршруту екрану додаткових функцій
  static const String _moreScreenPath = '/more';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: _moreScreenPath,
    observers: observers,
    routes: [
      if (routes.isNotEmpty) ...routes,
      GoRoute(
        path: _moreScreenPath,
        name: moreScreenName,
        builder: (context, state) => const MoreScreen(),
      ),
    ],
  );
}
