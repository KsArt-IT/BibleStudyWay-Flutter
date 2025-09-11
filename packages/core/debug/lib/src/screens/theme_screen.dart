import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';

/// {@template theme_screen}
/// Екран для налагодження та тестування теми програми.
///
/// Відповідає за:
/// - Демонстрацію перемикання між світлою та темною темами
/// - Відображення тестових кольорів із колірної схеми
/// - Показ поточного режиму теми
/// - Тестування системи управління темами
/// {@endtemplate}
class ThemeScreen extends StatelessWidget {
  /// {@macro theme_screen}
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ElevatedButton(
              onPressed: () {
                context.themeNotifier.changeTheme();
              },
              child: const Text('Змінити тему'),
            ),
            const SizedBox(height: 16),
            ColoredBox(
              color: context.appColors.primaryColor,
              child: const SizedBox(height: 100, width: 100),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shadowColor: colors.infoSnackbarBackground,
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: colors.infoSnackbarBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(
                  'Поточна тема: ${context.themeNotifier.themeMode}',
                  style: TextStyle(
                    color: colors.onPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.color_lens, color: colors.onPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
