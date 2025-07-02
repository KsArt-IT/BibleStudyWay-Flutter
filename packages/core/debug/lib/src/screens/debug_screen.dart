import 'package:core_config/config.dart';
import 'package:debug/debug.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template debug_screen}
/// Екран для налагодження програми
/// {@endtemplate}
class DebugScreen extends StatelessWidget {
  /// {@macro debug_screen}
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Оточення: ${context.appConfig.env.name}'),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () async {
                await context.debugService.openDebugScreen(context);
              },
              child: const Text('Викликати екран налагодження'),
            ),
            const SizedBox(height: 22),
            const Text('Екрани для налагодження:'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.iconsScreenName);
              },
              child: const Text('Екран з іконками'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.themeScreenName);
              },
              child: const Text('Екран налаштувань теми'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.tokensScreenName);
              },
              child: const Text('Екран з токенами'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.uiKitScreenName);
              },
              child: const Text('Екран UI Kit'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.langScreenName);
              },
              child: const Text('Екран локалізації'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(DebugRoutes.componentsScreenName);
              },
              child: const Text('Екран компонентів'),
            ),
            const SizedBox(height: 22),
            const Text('Імітація помилок:'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                throw Exception(
                  'Тестова помилка Exception для налагодження FlutterError',
                );
              },
              child: const Text('Викликати помилку FlutterError'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _callError();
              },
              child: const Text('Викликати помилку PlatformDispatcher'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _callError() async {
    throw Exception(
      'Тестова помилка Exception для налагодження PlatformDispatcher',
    );
  }
}
