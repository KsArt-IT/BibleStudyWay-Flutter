import 'package:core_config/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Метод отримання екземпляра AppConfig
  AppConfig get appConfig => read<AppConfig>();
}
