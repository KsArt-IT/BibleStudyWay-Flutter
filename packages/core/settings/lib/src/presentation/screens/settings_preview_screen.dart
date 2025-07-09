import 'package:core_localization/localization.dart';
import 'package:core_settings/src/presentation/settings_routes.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// {@template SettingsPreviewScreen}
/// Екран налаштувань для теми та мови у додатку
/// {@endtemplate}
class SettingsPreviewScreen extends StatelessWidget {
  /// {@macro SettingsPreviewScreen}
  const SettingsPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          title: Text(context.l10n.settingsApp),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward_ios),
          contentPadding: EdgeInsets.zero,
          onTap: () => context.pushNamed(SettingsRoutes.settingsScreenName),
        ),
        Consumer<ThemeNotifier>(
          builder: (context, theme, child) {
            return Column(
              children: [
                SwitchListTile(
                  title: Text(context.l10n.themeApp),
                  subtitle: Text(context.l10n.systemMode),
                  value: theme.isSystemMode,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) => theme.changeTheme(
                    darkMode: value ? null : theme.isDarkMode,
                  ),
                ),
                SwitchListTile(
                  title: Text(context.l10n.darkMode),
                  value: theme.isDarkMode,
                  contentPadding: const EdgeInsets.only(left: 24),
                  onChanged: theme.isSystemMode
                      ? null
                      : (value) => theme.changeTheme(darkMode: value),
                ),
              ],
            );
          },
        ),
        Consumer<LocalizationNotifier>(
          builder: (context, localization, child) {
            return Column(
              children: [
                SwitchListTile(
                  title: Text(
                    '${context.l10n.languageApp}: ${context.l10n.lang}',
                  ),
                  subtitle: Text(context.l10n.systemMode),
                  value: localization.isSystemMode,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) => localization.changeLocale(
                    value ? null : localization.locale,
                  ),
                ),

                ...AppLocalizations.supportedLocales.map(
                  (locale) => RadioListTile<Locale>(
                    title: Text(locale.name),
                    value: locale,
                    groupValue: localization.locale,
                    onChanged: localization.isSystemMode
                        ? null
                        : (value) => localization.changeLocale(value),
                    dense: true,
                    contentPadding: const EdgeInsets.only(left: 24),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
