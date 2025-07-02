import 'package:debug/debug.dart';
import 'package:flutter/material.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// {@template debug_service_impl}
/// Реалізація сервісу налагодження, за допомогою Talker
/// {@endtemplate}
class DebugServiceImpl implements DebugService {
  /// {@macro debug_service_impl}
  DebugService() {
    _talker = TalkerFlutter.init();
    _talkerDioLogger = TalkerDioLogger(talker: _talker);
    _talkerRouteObserver = TalkerRouteObserver(_talker);
    _talkerBlocObserver = TalkerBlocObserver(talker: _talker);
  }

  /// Назва сервісу
  static const name = 'DebugService';

  /// Реалізація Talker
  late final Talker _talker;

  /// Реалізація TalkerDioLogger
  late final TalkerDioLogger _talkerDioLogger;

  /// Реалізація TalkerRouteObserver
  late final TalkerRouteObserver _talkerRouteObserver;

  /// Реалізація TalkerBlocLoggerObserver
  late final TalkerBlocObserver _talkerBlocObserver;

  /// Отримує TalkerDioLoggerInterceptor
  @override
  TalkerDioLogger get dioLogger => _talkerDioLogger;

  /// Отримує TalkerRouteObserver
  @override
  TalkerRouteObserver get routeObserver => _talkerRouteObserver;

  /// Отримує TalkerBlocObserver
  @override
  TalkerBlocObserver get blocObserver => _talkerBlocObserver;

  @override
  void logDebug(
    Object message, {
    Object? logLevel,
    Map<String, dynamic>? args,
  }) {
    _talker.debug(
      message is Function ? Function.apply(message, []) as Object : message,
    );
  }

  @override
  void logError(
    Object message, {
    Object? error,
    Object? logLevel,
    Map<String, dynamic>? args,
    StackTrace? stackTrace,
  }) {
    final logMessage =
        message is Function ? Function.apply(message, []) as Object : message;
    _talker.error(logMessage, error, stackTrace);
  }

  @override
  void log(Object message, {Object? logLevel, Map<String, dynamic>? args}) {
    final logMessage =
        message is Function ? Function.apply(message, []) as Object : message;
    _talker.log(logMessage);
  }

  @override
  void logWarning(
    Object message, {
    Object? logLevel,
    Map<String, dynamic>? args,
  }) {
    final logMessage =
        message is Function ? Function.apply(message, []) as Object : message;
    _talker.warning(logMessage);
  }

  @override
  Future<void> openDebugScreen(
    BuildContext context, {
    bool useRootNavigator = false,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TalkerScreen(talker: _talker)),
    );
  }
}
