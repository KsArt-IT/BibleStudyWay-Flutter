import 'package:core_localization/localization.dart';
import 'package:core_shared/shared.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';

/// {@template lang_screen}
/// Екран для налагодження і тестування локалізації додатку.
///
/// Відповідає за:
/// - Демонстрацію переключення між підтримуваними мовами
/// - Відображення локалізованих рядків з різними шрифтами
/// - Тестування системи локалізації і шрифтів
/// - Показ текучого мови додатку
/// {@endtemplate}
class LangScreen extends StatelessWidget {
  /// {@macro lang_screen}
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lang')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocale(const Locale('ru', 'RU'));
              },
              child: const Text('Змінити мову на Українську'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocale(const Locale('ru', 'RU'));
              },
              child: const Text('Змінити мову на Русский'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.localization.changeLocale(const Locale('en', 'EN'));
              },
              child: const Text('Змінити мову на Англійську'),
            ),
            const SizedBox(height: 16),
            Text(
              'Тестове слово italic: ${context.l10n.helloWorld}',
              style: TextStyle(
                color: context.appColors.primaryColor,
                fontFamily: Assets.fonts.interItalic,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Тестове слово medium: ${context.l10n.helloWorld}',
              style: TextStyle(
                color: context.appColors.onPrimaryColor,
                fontFamily: FontFamily.inter,
              ),
            ),
            const SizedBox(height: 16),
            Text('Текучий мова: ${context.l10n.localeName}'),
          ],
        ),
      ),
    );
  }
}
