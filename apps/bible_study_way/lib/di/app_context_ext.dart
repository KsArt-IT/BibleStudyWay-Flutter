import 'package:bible_study_way/di/di_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Метод отримання екземпляра DIContainer
  DiContainer get di => read<DiContainer>();
}
