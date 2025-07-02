import 'package:core_theme/src/theme/colors/app_colors_scheme.dart';
import 'package:flutter/material.dart';

/// Клас для конфігурації світлої/темної теми програми
abstract class AppTheme {
  /// Отримання світлої теми
  static ThemeData get light => ThemeData.light().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.light],
  );

  /// Отримання темної теми
  static ThemeData get dark => ThemeData.dark().copyWith(
    extensions: <ThemeExtension<Object?>>[AppColors.dark],
  );
}
