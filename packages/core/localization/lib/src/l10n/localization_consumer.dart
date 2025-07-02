import 'package:core_localization/src/l10n/localization_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Тип функції для побудови віджету з урахуванням локалізації
typedef LocalizationBuilder = Widget Function();

/// {@template localization_consumer}
/// Віджет для підписки на зміни локалізації у додатку.
///
/// Автоматично перебудовує дочірні віджети при зміні мови,
/// Забезпечує реактивність інтерфейсу до змін налаштувань локалізації.
/// {@endtemplate}
class LocalizationConsumer extends StatelessWidget {
  /// {@macro localization_consumer}
  const LocalizationConsumer({required this.builder, super.key});

  /// Функція для побудови віджету з урахуванням поточної локалізації
  final LocalizationBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationNotifier>(
      builder: (_, __, ___) => builder(),
    );
  }
}
