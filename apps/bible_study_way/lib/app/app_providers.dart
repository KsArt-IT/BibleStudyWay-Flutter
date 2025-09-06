import 'package:auth/auth.dart';
import 'package:bible_study_way/di/di.dart';
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
    final repositories = context.di.repositories;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(settingsRepository: repositories.settingsRepository),
        ), // Провайдер для теми
        ChangeNotifierProvider(
          create: (_) => LocalizationNotifier(settingsRepository: repositories.settingsRepository),
        ), // Провайдер для локалізації
        // Провайдер для репозитория авторизации
        Provider.value(value: repositories.authRepository),
        Provider.value(value: SignOutUseCase(repositories.authRepository)),
      ],
      child: child,
    );
  }
}
