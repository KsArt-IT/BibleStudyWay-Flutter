import 'package:bible_study_way/di/di.dart';
import 'package:core_config/config.dart';
import 'package:core_debug/debug.dart';
import 'package:core_localization/localization.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// {@template root_screen}
/// Корневий екран з навігаційною структурою.
///
/// Відповідає за:
/// - Відображення основного навігаційного інтерфейсу.
/// - Управління переключенням між основними розділами додатку.
/// - Відображення кнопок відладки в непродакшн середовищах.
/// - Інтеграція з GoRouter для навігації.
/// {@endtemplate}
class RootScreen extends StatelessWidget {
  /// {@macro root_screen}
  const RootScreen({required this.navigationShell, super.key});

  /// Поточна гілка навігації від GoRouter
  /// Містить інформацію про поточне стан навігації
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: context.di.env != AppEnv.prod
          ? FloatingActionButton(
              child: const Icon(Icons.bug_report),
              onPressed: () {
                context.pushNamed(DebugRoutes.debugScreenName);
              },
            )
          : null,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 24,
        selectedFontSize: 12,
        unselectedFontSize: 12,

        selectedItemColor: theme.colorScheme.onSecondaryContainer,
        unselectedItemColor: theme.colorScheme.onSecondaryFixed,
        backgroundColor: theme.colorScheme.secondaryContainer,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: context.l10n.main,
          ), // MainScreen: 
          BottomNavigationBarItem(
            icon: Icon(Icons.view_comfy_outlined),
            activeIcon: Icon(Icons.view_comfy),
            label: context.l10n.lectures,
          ), // LecturesScreen
          BottomNavigationBarItem(
            icon: Icon(Icons.preview_outlined),
            activeIcon: Icon(Icons.preview),
            label: context.l10n.highlights,
          ), // HighlightsScreen
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(Icons.favorite),
            label: context.l10n.favorites,
          ), // FavoritesScreen
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_open_outlined),
            activeIcon: Icon(Icons.menu_open),
            label: context.l10n.more,
          ), // MoreScreen: ProfileScreen + OptionsScreen
        ],
      ),
    );
  }
}
