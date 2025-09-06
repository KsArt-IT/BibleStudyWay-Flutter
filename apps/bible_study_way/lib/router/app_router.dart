import 'dart:developer';

import 'package:auth/auth.dart';
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

  /// Початковий маршрут додатку
  static String get initialLocation => MainRoutes.mainScreenPath;

  /// Флаг для проверки авторизации
  static bool _isLogin = false;
  static bool _isSplash = false;

  /// Метод для перенаправления на маршрут авторизации, если пользователь не авторизован
  static Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    log('state.path: ${state.fullPath}', name: 'AppRouter');
    // Якщо це перший запуск, то перенаправляємо на екран Splash
    if (!_isSplash) {
      _isSplash = true;
      // Розморозка першого кадру
      WidgetsBinding.instance.addPostFrameCallback((_) {
        log('allowFirstFrame', name: 'AppRouter');
        WidgetsBinding.instance.allowFirstFrame();
      });
      // Перевіряємо чи є користувач в системі
      return AuthRoutes.splashScreenPath;
    }
    // Якщо користувач авторизований, то не перенаправляємо
    if (state.extra != null && state.extra is AuthUser) {
      _isLogin = true;
      return null;
    }
    if ((state.fullPath?.startsWith(AuthRoutes.loginScreenPath) ?? false) ||
        (state.fullPath == AuthRoutes.splashScreenPath)) {
      // Якщо маршрут публічний, то скидаємо флаг авторизації
      _isLogin = false;
      return null;
    }
    // Якщо користувач вже авторизований, то не перенаправляємо
    if (_isLogin) return null;
    // Якщо користувач не авторизований, то перенаправляємо на екран авторизації
    return AuthRoutes.loginScreenPath;
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
        GoRoute(
          path: AuthRoutes.splashScreenPath,
          name: AuthRoutes.splashScreenName,
          builder: (context, state) => const SplashProviders(),
        ),
      ],
    );
  }
}
