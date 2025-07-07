import 'package:bible_study_way/di/di.dart';
import 'package:core_config/config.dart';
import 'package:core_debug/debug.dart';

/// {@template dependencies_container}
/// Контейнер для залежностей
/// [env] - оточення додатку
/// [debugService] - сервіс для налагодження
/// {@endtemplate}
final class DiContainer {
  /// {@macro dependencies_container}
  DiContainer({required this.env, required DebugService dService})
    : debugService = dService;
  final AppEnv env;

  /// Сервіс для налагодження, отримуємо з конструктора
  late final DebugService debugService;

  /// Конфігурація додатку
  late final AppConfig appConfig;

  /// Сервіси додатку
  late final DiServices services;

  /// Репозиторії додатку
  late final DiRepositories repositories;

  /// Метод для ініціалізації залежностей
  Future<void> init({
    required OnProgress onProgress,
    required OnComplete onComplete,
    required OnError onError,
  }) async {
    // Ініціалізація конфігурації додатку
    appConfig = switch (env) {
      AppEnv.dev => AppConfigDev(),
      AppEnv.prod => AppConfigProd(),
      AppEnv.stage => AppConfigStage(),
    };

    // Ініціалізація сервісів
    services = DiServices();
    await services.init(
      onProgress: onProgress,
      onError: onError,
      diContainer: this,
    );

    // Ініціалізація репозиторіїв
    repositories = DiRepositories()
      ..init(onProgress: onProgress, onError: onError, diContainer: this);

    onComplete('Ініціалізація залежностей завершена!');
  }
}
