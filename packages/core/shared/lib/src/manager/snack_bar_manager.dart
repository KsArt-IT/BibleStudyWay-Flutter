import 'package:flutter/material.dart';

abstract final class SnackBarManager {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showOf(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 5), //
          showCloseIcon: true,
        ), //
      );
  }

  static void show(String message) {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3), //
        ), //
      );
  }

  static void showError(String message) {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.redAccent.withAlpha(128),
        ),
      );
  }
}
