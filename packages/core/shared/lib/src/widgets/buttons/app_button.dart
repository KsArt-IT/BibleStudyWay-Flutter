import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';

/// {@template app_button}
/// Customizable button with various styles and states
/// {@endtemplate}
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final bool isLoading;
  final bool isDisabled;
  final double width;
  final double height;
  final double borderRadius;

  /// {@macro app_button}
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.width = double.infinity,
    this.height = AppConstants.buttonHeight,
    this.borderRadius = AppConstants.buttonRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final buttonChild = isLoading
        ? SizedBox(
            width: AppConstants.iconMedium,
            height: AppConstants.iconMedium,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                style == AppButtonStyle.outline
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onPrimary,
              ),
            ),
          )
        : Text(
            label,
            style: isDisabled
                ? theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withAlpha(AppConstants.buttonAlphaDisabled),
                  )
                : theme.textTheme.bodyMedium,
          );

    final button = switch (style) {
      AppButtonStyle.primary => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: buttonChild,
      ),

      AppButtonStyle.secondary => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          foregroundColor: theme.colorScheme.onSecondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: buttonChild,
      ),

      AppButtonStyle.outline => OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: AppConstants.buttonBorderWidth,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: buttonChild,
      ),

      AppButtonStyle.text => TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: buttonChild,
      ),
    };
    return SizedBox(
      width: width,
      height: height,
      child: button, //
    );
  }
}
