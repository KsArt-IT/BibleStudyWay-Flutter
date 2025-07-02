import 'dart:async';
import 'dart:ui';

import 'package:bible_study_way/app/app.dart';
import 'package:bible_study_way/di/di.dart';
import 'package:bible_study_way/router/app_router.dart';
import 'package:bible_study_way/runner/timer_runner.dart';
import 'package:bloc/bloc.dart';
import 'package:core_config/config.dart';
import 'package:core_debug/debug.dart';
import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

part 'errors_handlers.dart';

/// Час очікування ініціалізації залежностей
/// Якщо час перевищено, то буде показано екран помилки
/// Надалі потрібно прибрати в env
const _initTimeout = Duration(seconds: 7);

/// Клас, що реалізує раннер для конфігурування програми під час запуску
///
/// Порядок ініціалізації:
/// 1. _initApp - ініціалізація конфігурації програми
/// 2. ініціалізація репозиторіїв програми (буде пізніше)
/// 3. runApp - запуск програми
/// 4. _onAppLoaded - після запуску програми
class AppRunner {
  /// Створює екземпляр раннера програми
  ///
  /// Приймає:
  /// - [env] - тип оточення збірки програми
  AppRunner(this.env);

  /// Тип оточення збірки програми
  final AppEnv env;

  /// Контейнер залежностей програми
  late DebugService _debugService;

  /// Роутер програми
  late GoRouter router;

  /// Таймер для відстеження часу ініціалізації програми
  late TimerRunner _timerRunner;

  /// Метод для запуску програми
  Future<void> run() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      
      // Ініціалізація сервісу налагодження додатку
      _debugService = DebugServiceImpl();

      // Ініціалізація Таймера для підрахунку часу запуску програми
      _timerRunner = TimerRunner(_debugService);

      // Ініціалізація Talker для відстеження Bloc
      Bloc.observer = _debugService.blocObserver;

      // Ініціалізація програми
      await _initApp();

      // Ініціалізація методу обробки помилок
      _initErrorHandlers(_debugService);

      // Ініціалізація роутера
      router = AppRouter.createRouter(_debugService);

      // throw Exception('Test error');

      runApp(
        App(
          router: router,
          initDependencies: () {
            return _initDependencies(
              debugService: _debugService,
              env: env,
              timerRunner: _timerRunner,
            ).timeout(
              _initTimeout,
              onTimeout: () {
                return Future.error(
                  TimeoutException(
                    'Перевищено час очікування ініціалізації залежностей',
                  ),
                );
              },
            );
          },
        ),
      );
      await _onAppLoaded();
    } on Object catch (e, stackTrace) {
      await _onAppLoaded();

      /// Якщо сталася помилка під час ініціалізації програми,
      /// то запускаємо екран помилок
      runApp(ErrorScreen(error: e, stackTrace: stackTrace, onRetry: run));
    }
  }

  /// Метод ініціалізації програми,
  /// виконується до запуску програми
  Future<void> _initApp() async {
    // Заборона на поворот екрана
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Заморозка першого кадру (сплеш)
    WidgetsBinding.instance.deferFirstFrame();
  }

  /// Метод спрацьовує після запуску програми
  Future<void> _onAppLoaded() async {
    // Розморозка першого кадру (сплеш)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  // Метод для ініціалізації залежностей програми
  Future<DiContainer> _initDependencies({
    required DebugService debugService,
    required AppEnv env,
    required TimerRunner timerRunner,
  }) async {
    // Імітація затримки ініціалізації
    // TODO: Вилучити після перевірки
    await Future.delayed(const Duration(seconds: 3));
    debugService.log(() => 'Тип сборки: ${env.name}');
    final diContainer = DiContainer(env: env, dService: debugService);
    await diContainer.init(
      onProgress: (name) => timerRunner.logOnProgress(name),
      onComplete: (name) {
        timerRunner
          ..logOnComplete(name)
          ..stop();
      },
      onError: (message, error, [stackTrace]) =>
          debugService.logError(message, error: error, stackTrace: stackTrace),
    );
    //throw Exception('Test error');
    return diContainer;
  }
}
