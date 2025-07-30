import 'package:core_localization/localization.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template app_internal}
/// Внутрішній віджет додатку, що відображає основний інтерфейс
/// після успішної ініціалізації залежностей.
///
/// Налаштовує MaterialApp з роутером, темами та локалізацією.
/// {@endtemplate}
class AppMaterial extends StatelessWidget {
  /// {@macro app_internal}
  const AppMaterial({required this.router, super.key});

  /// Роутер для навігації між екранами у додатку
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: AppTheme.dark,
      theme: AppTheme.light,
      themeMode: context.theme.themeMode,
      locale: context.localization.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
