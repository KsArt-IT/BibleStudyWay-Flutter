import 'package:flutter/material.dart';

/// {@template ProgressScreen}
/// Екран прогресу вивчення курсу
/// {@endtemplate}
class ProgressScreen extends StatelessWidget {
  /// {@macro ProgressScreen}
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Progress Screen'),
          ],
        ),
      ),
    );
  }
}
