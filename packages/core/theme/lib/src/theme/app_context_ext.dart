import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Геттер для отримання теми
  ThemeNotifier get theme => read<ThemeNotifier>();
}
