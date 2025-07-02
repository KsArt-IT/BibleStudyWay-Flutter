import 'package:core_localization/localization.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас для додавання провайдерів теми та локалізації
final class AppProviders extends StatelessWidget {
  const AppProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ), // Провайдер для теми
        ChangeNotifierProvider(
          create: (_) => LocalizationNotifier(),
        ), // Провайдер для локалізації
      ],
      child: child,
    );
  }
}
