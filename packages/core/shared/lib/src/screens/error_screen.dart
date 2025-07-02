import 'package:flutter/material.dart';

/// {@template ErrorScreen}
/// Екран, коли в додатку сталася фатальна помилка
/// {@endtemplate}
class ErrorScreen extends StatelessWidget {
  /// {@macro ErrorScreen}
  const ErrorScreen({
    required this.error,
    required this.stackTrace,
    super.key,
    this.onRetry,
  });

  final Object? error;
  final StackTrace? stackTrace;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onRetry,
                  child: const Text('Перезавантажити додаток'),
                ),
                const SizedBox(height: 16),
                Text('''
          Щось пішло не так, спробуйте перезавантажити додаток
          error: $error
                stackTrace: $stackTrace
                  ''', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
