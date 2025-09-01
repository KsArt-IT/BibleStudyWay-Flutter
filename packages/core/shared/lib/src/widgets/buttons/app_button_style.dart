import 'package:core_shared/shared.dart';
import 'package:core_shared/src/constants/app_constants.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';

/// Available button styles
enum AppButtonStyle { primary, secondary, outline, text }

/// Icon position relative to text
enum IconPosition { start, end }

/// Available button sizes
enum AppButtonSize {
  small,
  medium,
  large;

  Size get minimumSize => switch (this) {
    small => Size(80, 32),
    medium => Size(100, 40),
    large => Size(120, 48),
  };

  double get iconSize => switch (this) {
    small => AppConstants.iconSmall,
    medium => AppConstants.iconMedium,
    large => AppConstants.iconLarge,
  };

  EdgeInsetsGeometry get padding => switch (this) {
    small => EdgeInsets.symmetric(
      horizontal: AppConstants.paddingSmall,
      vertical: AppConstants.paddingSmall,
    ),
    medium => EdgeInsets.symmetric(
      horizontal: AppConstants.paddingMedium,
      vertical: AppConstants.paddingMedium,
    ),
    large => EdgeInsets.symmetric(
      horizontal: AppConstants.paddingLarge,
      vertical: AppConstants.paddingLarge,
    ),
  };

  BorderRadius get borderRadius => switch (this) {
    small => BorderRadius.circular(6),
    medium => BorderRadius.circular(8),
    large => BorderRadius.circular(12),
  };

  TextStyle getTextStyle(BuildContext context) => switch (this) {
    small => context.textTheme.bodyMedium!.copyWith(
      fontSize: AppConstants.fontSmall,
      fontWeight: FontWeight.w400,
    ),
    medium => context.textTheme.bodyMedium!.copyWith(
      fontSize: AppConstants.fontMedium,
      fontWeight: FontWeight.w500,
    ),
    large => context.textTheme.bodyMedium!.copyWith(
      fontSize: AppConstants.fontLarge,
      fontWeight: FontWeight.w600,
    ),
  };
}
