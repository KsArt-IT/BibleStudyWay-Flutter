import 'package:core_theme/src/theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Тип функції для побудови віджету з урахуванням теми
typedef ThemeBuilder = Widget Function();

/// {@template theme_consumer}
/// Віджет для підписки на зміни теми у додатку.
///
/// Автоматично перебудовує дочірні віджети при зміні теми,
/// Забезпечує реактивність інтерфейсу до змін налаштувань теми.
/// {@endtemplate}
class ThemeConsumer extends StatelessWidget {
  /// {@macro theme_consumer}
  const ThemeConsumer({required this.builder, super.key});

  /// Функція для побудови віджета з урахуванням поточної теми
  final ThemeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (_, __, ___) => builder(),
    );
  }
}
