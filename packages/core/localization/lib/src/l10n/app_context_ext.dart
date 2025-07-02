import 'package:core_localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Клас, що реалізує розширення для контексту програми
extension AppContextExt on BuildContext {
  /// Геттер для отримання локалізації
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Геттер для отримання керування локалізацією
  LocalizationNotifier get localization => read<LocalizationNotifier>();
}
