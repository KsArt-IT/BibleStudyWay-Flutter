import 'package:core_debug/debug.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template app_router}
///  AppRouter - клас для управління навігацією в додатку
///  [createRouter] - метод для створення екземпляра GoRouter
/// {@endtemplate}
class AppRouter {
  /// {@macro app_router}
  const AppRouter();

  /// Ключ для доступу до корневого навігатора додатку
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Начальний роут додатку
  static String get initialLocation => 'main';

  /// Метод для створення екземпляра GoRouter
  static GoRouter createRouter(DebugService debugService) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      observers: [debugService.routeObserver],
      routes: [
      ],
    );
  }
}
