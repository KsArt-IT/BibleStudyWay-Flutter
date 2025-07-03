import 'package:bible_study_way/di/di.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас для впровадження глобальних залежностей
final class DependsProviders extends StatelessWidget {
  const DependsProviders({
    required this.child,
    required this.diContainer,
    super.key,
  });

  final Widget child;
  final DiContainer diContainer;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Сюди додаємо глобальні блоки, inherited і т.д.
      providers: [
        // Передаємо контейнер залежностей
        Provider.value(value: diContainer),
        Provider.value(value: diContainer.appConfig),
      ],
      child: child,
    );
  }
}
