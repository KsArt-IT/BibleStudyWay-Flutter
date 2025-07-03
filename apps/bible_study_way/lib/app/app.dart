import 'package:bible_study_way/app/app_providers.dart';
import 'package:bible_study_way/app/depends_providers.dart';
import 'package:bible_study_way/di/di.dart';
import 'package:core_localization/localization.dart';
import 'package:core_shared/shared.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splash/splash.dart';

/// {@template app}
/// Головний віджет програми, який керує ініціалізацією залежностей
/// та відображенням основного інтерфейсу програми.
///
/// Відповідає за:
/// - Ініціалізацію залежностей додатку
/// - Відображення екрана завантаження під час ініціалізації
/// - Обробку помилок ініціалізації
/// - Налаштування провайдерів для теми та локалізації
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({required this.router, required this.initDependencies, super.key});

  /// Роутер для навігації між екранами у додатку
  final GoRouter router;

  /// Функція для ініціалізації залежностей програми
  /// Повертає Future з контейнером залежностей
  final Future<DiContainer> Function() initDependencies;

  @override
  State<App> createState() => _AppState();
}

/// {@template app_state}
/// Стан головного віджету програми.
///
/// Керує процесом ініціалізації залежностей та відображенням
/// Відповідних екранів залежно стану ініціалізації.
/// {@endtemplate}
class _AppState extends State<App> {
  /// {@macro app_state}
  _AppState();

  /// Мутабельна Future для ініціалізації залежностей
  /// Дозволяє перезапускати ініціалізацію при помилках
  late Future<DiContainer> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = widget.initDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Провайдери теми та локалізації
    return AppProviders(
      child: FutureBuilder<DiContainer>(
        future: _initFuture,
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              // Поки ініціалізація показуємо Splash
              // return const SplashScreen();
              return const SizedBox.shrink();
            case ConnectionState.done:
              if (snapshot.hasError) {
                // Відобразити помилки
                return ErrorScreen(
                  error: snapshot.error,
                  stackTrace: snapshot.stackTrace,
                  onRetry: _retryInit,
                );
              }

              final diContainer = snapshot.data;
              if (diContainer == null) {
                // Відобразити помилки
                return ErrorScreen(
                  error:
                      'Помилка ініціалізації залежностей, diContainer = null',
                  stackTrace: null,
                  onRetry: _retryInit,
                );
              }
              return DependsProviders(
                diContainer: diContainer,
                // Зміни локалізації у додатку
                child: LocalizationConsumer(
                  builder: () =>
                      // Зміни теми у додатку
                      ThemeConsumer(builder: () => _App(router: widget.router)),
                ),
              );
          }
        },
      ),
    );
  }

  /// Метод для перезапуску ініціалізації залежностей
  /// Викликається при помилках ініціалізації для повторної спроби
  void _retryInit() {
    setState(() {
      _initFuture = widget.initDependencies();
    });
  }
}

/// {@template app_internal}
/// Внутрішній віджет додатку, що відображає основний інтерфейс
/// після успішної ініціалізації залежностей.
///
/// Налаштовує MaterialApp з роутером, темами та локалізацією.
/// {@endtemplate}
class _App extends StatelessWidget {
  /// {@macro app_internal}
  const _App({required this.router});

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
