import 'package:flutter/material.dart';

/// {@template tokens_screen}
/// Екран для відображення та керування токенами аутентифікації.
///
/// Відповідає за:
/// - Відображення теперішніх токенів доступу та оновлення
/// - Демонстрацію роботи з токенами в додатку
/// - Тестування функціональності аутентифікації
///
/// В текучій реалізації є заглушкою для майбутньої функціональності.
/// {@endtemplate}
class TokensScreen extends StatelessWidget {
  /// {@macro tokens_screen}
  const TokensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tokens')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text('Access Token: '),
            SizedBox(height: 16),
            Text('Refresh Token: '),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
