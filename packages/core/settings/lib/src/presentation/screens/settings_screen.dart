import 'package:core_localization/localization.dart';
import 'package:flutter/material.dart';

/// {@template SettingsScreen}
/// Екран налаштувань у додатку
/// {@endtemplate}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the settings screen
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingsApp)),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(context.l10n.themeApp),
          Text(context.l10n.languageApp),
        ],
      ),
    );
  }
}
