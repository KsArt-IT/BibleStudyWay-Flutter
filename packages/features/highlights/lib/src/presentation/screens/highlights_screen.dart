import 'package:flutter/material.dart';

/// {@template HighlightsScreen}
/// Екран основних моментів
/// {@endtemplate}
class HighlightsScreen extends StatelessWidget {
  /// {@macro HighlightsScreen}
  const HighlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Highlights Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Highlights Screen'),
          ],
        ),
      ),
    );
  }
}
