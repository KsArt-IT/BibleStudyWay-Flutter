import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:main/src/presentation/screens/main_screen.dart';

abstract final class MainRoutes {
  /// Назва маршруту головної сторінки
  static const String mainScreenName = 'main_screen';

  /// Путь маршруту головної сторінки
  static const String mainScreenPath = '/main';

  /// Метод для побудови вітки маршрутів по фічі
  ///
  /// Приймає:
  /// - [routes] - вкладені маршрути
  static StatefulShellBranch buildShellBranch({
    List<RouteBase> routes = const [],
    List<NavigatorObserver>? observers,
  }) => StatefulShellBranch(
    initialLocation: mainScreenPath,
    observers: observers,
    routes: [
      if (routes.isNotEmpty) ...routes,
      GoRoute(
        path: mainScreenPath,
        name: mainScreenName,
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}
