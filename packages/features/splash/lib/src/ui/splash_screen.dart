import 'package:flutter/material.dart';

/// {@template SplashScreen}
/// Екран завантаження додатку.
/// {@endtemplate}
class SplashScreen extends StatelessWidget {
  /// {@macro SplashScreen}
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.blueAccent,
            Colors.lightGreen,
            Colors.yellowAccent,
            //
          ],
          center: Alignment.topCenter,
          stops: [0.3, 1.0],
          radius: 2,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(Icons.book_online),
                    Text(
                      "Bible school",
                      style: TextStyle(fontSize: 18),
                      //
                    ),
                    //
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "StudyWay.life",
                  style: TextStyle(fontSize: 12),
                  //
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
