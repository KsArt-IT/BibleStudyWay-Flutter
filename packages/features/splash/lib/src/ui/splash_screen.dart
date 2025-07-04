import 'dart:ui';

import 'package:flutter/material.dart';

/// {@template SplashScreen}
/// Екран завантаження додатку.
/// {@endtemplate}
class SplashScreen extends StatelessWidget {
  /// {@macro SplashScreen}
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Фоновий градієнт
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.blueAccent,
                    Colors.lightGreen,
                    Colors.yellowAccent,
                  ],
                  center: Alignment.topCenter,
                  stops: [0.6, 0.8, 1.0],
                  radius: 1.5,
                ),
              ),
            ),
            // Розмитий шар
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(color: Colors.white.withAlpha(100)),
            ),
            // Основной контент
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.menu_book,
                          color: Colors.white,
                          size: 200,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Bible school",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "StudyWay.life",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
