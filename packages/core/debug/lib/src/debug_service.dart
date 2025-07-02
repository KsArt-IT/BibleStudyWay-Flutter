import 'package:flutter/material.dart';

/// {@template debug_service}
/// Інтерфейс для сервісу налагодження
/// {@endtemplate}
abstract interface class DebugService {
  static const name = 'DebugService';

  /// Наблюдження за dio
  dynamic get dioLogger;

  /// Наблюдження за роутами
  dynamic get routeObserver;

  /// Наблюдження за BLoC
  dynamic get blocObserver;

  /// Метод для логування повідомлень
  void log(Object message, {Object logLevel, Map<String, dynamic>? args});

  /// Метод для логування попереджень
  void logWarning(
    Object message, {
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для логування помилок
  void logError(
    Object message, {
    Object error,
    StackTrace? stackTrace,
    Object logLevel,
    Map<String, dynamic>? args,
  });

  /// Метод для обробки помилок
  void logDebug(Object message, {Object logLevel, Map<String, dynamic>? args});

  /// Метод для відкриття вікна налагодження
  ///
  /// Приймає:
  /// - [context] - для визначення навігатора по ньому
  /// - [useRootNavigator] - при true, відкриває вікно в корневому навігаторі
  Future<void> openDebugScreen(
    BuildContext context, {
    bool useRootNavigator = false,
  });
}
