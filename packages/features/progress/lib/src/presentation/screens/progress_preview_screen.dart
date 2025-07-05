import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progress/src/presentation/progress_routes.dart';

/// {@template ProgressPreviewScreen}
/// Екран перегляду прогресу вивчення курсу
/// {@endtemplate}
class ProgressPreviewScreen extends StatelessWidget {
  /// {@macro ProgressPreviewScreen}
  const ProgressPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(ProgressRoutes.progressScreenName),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Progress Preview Screen'),
            const Icon(Icons.circle_notifications_outlined),
          ],
        ),
      ),
    );
  }
}
