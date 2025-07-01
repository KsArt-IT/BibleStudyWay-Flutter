import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors_scheme.tailor.dart';

/// {@template app_colors}
/// Клас, що реалізує розширення для додавання кольорів у колірну схему
/// {@endtemplate}
@TailorMixin(themeGetter: ThemeGetter.onBuildContext)
class AppColors extends ThemeExtension<AppColors> with _$AppColorsTailorMixin {
  /// {@macro app_colors}
  ///
  /// Приймає:
  ///
  /// * [primaryColor] –
  /// * [backgroundColor] – колір фону
  const AppColors({
    required this.primaryColor,
    required this.onPrimaryColor,

    required this.secondaryColor,
    required this.onSecondaryColor,

    required this.primaryContainerColor,
    required this.onPrimaryContainerColor,

    required this.secondaryContainerColor,
    required this.onSecondaryContainerColor,

    required this.errorColor,
    required this.onErrorColor,

    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.backgroundColor,
  });

  @override
  final Color primaryColor;
  @override
  final Color onPrimaryColor;

  @override
  final Color secondaryColor;
  @override
  final Color onSecondaryColor;

  @override
  final Color primaryContainerColor;
  @override
  final Color onPrimaryContainerColor;

  @override
  final Color secondaryContainerColor;
  @override
  final Color onSecondaryContainerColor;

  @override
  final Color errorColor;
  @override
  final Color onErrorColor;

  @override
  final Color surfaceColor;
  @override
  final Color onSurfaceColor;

  @override
  final Color backgroundColor;

  /// Кольори світлої теми
  static final AppColors light = AppColors(
    primaryColor: Colors.lightBlue[300] ?? Colors.red,
    onPrimaryColor: const Color(0xFF1F1F1F), // 900

    secondaryColor: Colors.lightBlue[700] ?? Colors.red,
    onSecondaryColor: const Color(0xFF1F1F1F),

    primaryContainerColor: Colors.lightBlue[50] ?? Colors.red,
    onPrimaryContainerColor: const Color(0xFF1F1F1F),

    secondaryContainerColor: Colors.lightBlue[100] ?? Colors.red,
    onSecondaryContainerColor: const Color(0xFF1F1F1F),

    errorColor: Colors.red[400] ?? Colors.red,
    onErrorColor: Colors.red[800] ?? Colors.red,

    surfaceColor: Colors.lightBlue[700] ?? Colors.red,
    onSurfaceColor: const Color(0xFF1F1F1F),
    backgroundColor: Colors.lightBlue[100] ?? Colors.red,
  );

  /// Кольори темної теми
  static final AppColors dark = AppColors(
    primaryColor: Colors.blue[800] ?? Colors.red,
    onPrimaryColor: const Color(0xFFEBEBEB), // 100

    secondaryColor: Colors.blue[700] ?? Colors.red,
    onSecondaryColor: const Color(0xFFEBEBEB),

    primaryContainerColor: Colors.blue[700] ?? Colors.red,
    onPrimaryContainerColor: const Color(0xFFEBEBEB),

    secondaryContainerColor: Colors.blue[800] ?? Colors.red,
    onSecondaryContainerColor: const Color(0xFFEBEBEB),

    errorColor: Colors.red[700] ?? Colors.red,
    onErrorColor: Colors.red[900] ?? Colors.red,

    surfaceColor: Colors.blue[700] ?? Colors.red,
    onSurfaceColor: const Color(0xFFEBEBEB),
    backgroundColor: Colors.blue[900] ?? Colors.red,
  );
}
