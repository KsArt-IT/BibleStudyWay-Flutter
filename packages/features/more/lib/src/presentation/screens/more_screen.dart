import 'package:flutter/material.dart';

/// {@template MoreScreen}
/// Екран додаткових функцій
/// {@endtemplate}
class MoreScreen extends StatelessWidget {
  /// {@macro MoreScreen}
  const MoreScreen({super.key, required this.children});

    /// Список дочірніх елементів
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More Screen')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: children,
      ),
    );
  }
}
