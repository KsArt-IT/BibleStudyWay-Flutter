import 'package:flutter/material.dart';

/// {@template MainScreen}
/// Головний екран додатку
/// {@endtemplate}
class MainScreen extends StatelessWidget {
  /// {@macro MainScreen}
  const MainScreen({super.key, required this.children});

  /// Список дочірніх елементів
  final List<Widget> children;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Screen")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: children,
      ),
    );
  }
}