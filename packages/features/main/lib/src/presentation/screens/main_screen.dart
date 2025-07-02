import 'package:flutter/material.dart';

/// {@template MainScreen}
/// Головний екран додатку
/// {@endtemplate}
class MainScreen extends StatelessWidget {
  /// {@macro MainScreen}
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ],
        ),
      ),
    );
  }
}
