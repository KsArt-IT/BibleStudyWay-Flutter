import 'package:bible_study_way/di/app_context_ext.dart';
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
import 'package:auth/auth.dart';
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

  /// Публичные маршруты, которые не требуют авторизации
  static const _publicRoutes = [
    AuthRoutes.loginScreenName,
    AuthRoutes.registrationScreenName,
    AuthRoutes.resetPasswordScreenName,
  ];

  /// Метод для перенаправления на маршрут авторизации, если пользователь не авторизован
  static Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    if (_publicRoutes.any((route) => route == state.name)) return null;
    return context.di.services.firebaseAuth.currentUser != null ? null : AuthRoutes.loginScreenName;
  }

  /// Метод для створення екземпляра GoRouter
  static GoRouter createRouter(DebugService debugService) {
    return GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      redirect: _redirect,
      initialLocation: WidgetsBinding.instance.platformDispatcher.defaultRouteName,
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
        AuthRoutes.buildRoutes(),
        DebugRoutes.buildRoutes(),
      ],
    );
  }
}
