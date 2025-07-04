import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:favorites/src/presentation/screens/favorites_screen.dart';

abstract final class FavoritesRoutes {
  /// Назва маршруту екрану вибраних лекцій
  static const String favoritesScreenName = 'favorites_screen';

  /// Путь маршруту екрану вибраних лекцій
  static const String _favoritesScreenPath = '/favorites';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: _favoritesScreenPath,
    observers: observers,
    routes: [
      if (routes.isNotEmpty) ...routes,
      GoRoute(
        path: _favoritesScreenPath,
        name: favoritesScreenName,
        builder: (context, state) => const FavoritesScreen(),
      ),
    ],
  );
}
