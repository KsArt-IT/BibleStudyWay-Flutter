import 'package:bible_study_way/di/di_typedefs.dart';
import 'package:core_config/config.dart';
import 'package:debug/debug.dart';

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

    // throw Exception('Тестова – помилка ініціалізації залежностей');

    onComplete('Ініціалізація залежностей завершена!');
  }
}
