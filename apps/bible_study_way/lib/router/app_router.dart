import 'package:bible_study_way/root/root_screen.dart';
import 'package:core_debug/debug.dart';
import 'package:core_settings/settings.dart';
import 'package:favorites/favorites.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlights/highlights.dart';
import 'package:lectures/lectures.dart';
import 'package:main/main.dart';
import 'package:more/more.dart';
import 'package:progress/progress.dart';

/// {@template app_router}
///  AppRouter - клас для управління навігацією у додатку.
///  [createRouter] - метод для створення екземпляра GoRouter
/// {@endtemplate}
abstract final class AppRouter {
  /// {@macro app_router}
  const AppRouter._();

  /// Ключ для доступу до корневого навігатора додатку
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальний маршрут додатку
  static String get initialLocation => MainRoutes.mainScreenPath;

  /// Метод для створення екземпляра GoRouter
  static GoRouter createRouter(DebugService debugService) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation:
          WidgetsBinding.instance.platformDispatcher.defaultRouteName,
      observers: [debugService.routeObserver],
      routes: [
        GoRoute(path: '/', redirect: (context, state) => initialLocation),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (context, state, navigationShell) =>
              RootScreen(navigationShell: navigationShell),
          branches: [
            MainRoutes.buildShellBranch(
              children: [
                ProgressPreviewScreen(),
                //
              ],
              routes: [
                ProgressRoutes.buildRoutes(),
                //
              ],
            ),
            LecturesRoutes.buildShellBranch(),
            HighlightsRoutes.buildShellBranch(),
            FavoritesRoutes.buildShellBranch(),
            MoreRoutes.buildShellBranch(
              children: [
                SettingsPreviewScreen(),
                //
              ],
              routes: [
                SettingsRoutes.buildRoutes(),
                //
              ],
            ),
          ],
        ),
        DebugRoutes.buildRoutes(),
      ],
    );
  }
}
