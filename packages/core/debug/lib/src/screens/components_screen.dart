import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';

/// {@template components_screen}
/// Екран для демонстрації та тестування компонентів застосунку.
///
/// Відповідає за:
/// - Демонстрацію різних типів снекбарів (помилка, успіх, інформація)
/// - Тестування кастомних UI компонентів
/// - Надання прикладів використання компонентів
/// - Валідацію коректності роботи компонентів
/// {@endtemplate}
class ComponentsScreen extends StatefulWidget {
  /// {@macro components_screen}
  const ComponentsScreen({super.key});

  @override
  State<ComponentsScreen> createState() => _ComponentsScreenState();
}

/// {@template components_screen_state}
/// Стан екрану компонентів.
///
/// Керує відображенням різних типів снекбарів
/// і демонструє їх функціональність.
/// {@endtemplate}
class _ComponentsScreenState extends State<ComponentsScreen> {
  /// {@macro components_screen_state}
  _ComponentsScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Компоненти')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showError(
                  context,
                  message:
                      'Виникла помилка, це просто довге повідомлення, для перевірки, яке займає 3 рядки',
                );
              },
              child: const Text('Показати снекбар з помилкою'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showSuccess(
                  context: context,
                  message:
                      'Все супер, це просто довге повідомлення, для перевірки, яке займає 3 рядки',
                );
              },
              child: const Text('Показати снекбар з успіхом'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                AppSnackBar.showInfo(
                  context,
                  message: 'Це просто повідомлення',
                );
              },
              child: const Text('Показати снекбар з інформацією'),
            ),
          ],
        ),
      ),
    );
  }
}
