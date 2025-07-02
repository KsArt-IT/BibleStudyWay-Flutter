import 'package:core_config/src/app_env.dart';
import 'package:envied/envied.dart';

part 'app_config.g.dart';

/// {@template i_app_config}
/// Інтерфейс конфігурації додатку.
///
/// Визначає обов'язкові параметри всім реалізацій конфігурації:
/// - Найменування конфігурації
/// - Тип оточення (dev, prod, stage)
/// - Режим тестування
/// {@endtemplate}
abstract interface class AppConfig {
  /// {@macro i_app_config}
  AppConfig();

  /// Найменування сервісу конфігурації
  String get name => 'AppConfig';

  /// Тип оточення (dev, prod, stage) 
  AppEnv get env;

  /// Режим тестування
  bool get debugMode;
}

/// {@template app_config_dev}
/// Клас для реалізації конфігурації додатку в режимі розробки.
///
/// Використовує змінні оточення з файлу env/dev.env.
/// Призначень для локальної розробки та тестування.
/// {@endtemplate}
@Envied(name: 'Dev', path: '../../../apps/bible_study_way/env/dev.env')
class AppConfigDev implements AppConfig {
  /// {@macro app_config_dev}
  AppConfigDev();

  @override
  AppEnv get env => AppEnv.dev;

  @override
  String get name => 'AppConfigDev';

  @override
  @EnviedField(obfuscate: true, varName: 'DEBUG_MODE')
  final bool debugMode = _Dev.debugMode;
}

/// {@template app_config_prod}
/// Клас для реалізації конфігурації додатку в продакшн режимі.
///
/// Використовує змінні оточення з файлу env/prod.env.
/// Призначений для фінальної збірки додатку.
/// {@endtemplate}
@Envied(name: 'Prod', path: '../../../apps/bible_study_way/env/prod.env')
class AppConfigProd implements AppConfig {
  /// {@macro app_config_prod}
  AppConfigProd();

  @override
  AppEnv get env => AppEnv.prod;

  @override
  String get name => 'AppConfigProd';

  @override
  @EnviedField(obfuscate: true, varName: 'DEBUG_MODE')
  final bool debugMode = _Prod.debugMode;
}

/// {@template app_config_stage}
/// Клас для реалізації конфігурації додатку в стейдж режимі.
///
/// Використовує змінні оточення з файлу env/stage.env.
/// Призначений для тестування в середовищі, близькому до продакшну.
/// {@endtemplate}
@Envied(name: 'Stage', path: '../../../apps/bible_study_way/env/stage.env')
class AppConfigStage implements AppConfig {
  /// {@macro app_config_stage}
  AppConfigStage();

  @override
  AppEnv get env => AppEnv.stage;

  @override
  String get name => 'AppConfigStage';

  @override
  @EnviedField(obfuscate: true, varName: 'DEBUG_MODE')
  final bool debugMode = _Stage.debugMode;
}
