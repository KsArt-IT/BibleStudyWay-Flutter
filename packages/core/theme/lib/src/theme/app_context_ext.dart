import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Геттер для отримання нотифікатора теми
  ThemeNotifier get themeNotifier => read<ThemeNotifier>();

  /// Геттер для отримання теми
  ThemeData get theme => Theme.of(this);

  /// Геттер для отримання кольорової схеми
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Геттер для отримання текстової теми
  TextTheme get textTheme => Theme.of(this).textTheme;
}
