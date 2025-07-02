import 'package:debug/debug.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Метод отримання екземпляра DebugService
  DebugService get debugService => read<DebugService>();
}
