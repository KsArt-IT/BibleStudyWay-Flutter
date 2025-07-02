import 'package:flutter/material.dart';

/// {@template LecturesScreen}
/// Екран лекцій
/// {@endtemplate}
class LecturesScreen extends StatelessWidget {
  /// {@macro LecturesScreen}
  const LecturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lectures Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Lectures Screen'),
          ],
        ),
      ),
    );
  }
}
