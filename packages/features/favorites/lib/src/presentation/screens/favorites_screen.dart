import 'package:flutter/material.dart';

/// {@template FavoritesScreen}
/// Екран вибраних лекцій
/// {@endtemplate}
class FavoritesScreen extends StatelessWidget {
  /// {@macro FavoritesScreen}
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const Text('Favorites Screen')],
        ),
      ),
    );
  }
}
