import 'package:core_shared/shared.dart';
import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';

/// Customizable text button with various styles and states
class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonStyle style;
  final AppButtonSize size;
  final double? width;
  final bool isLoading;
  final bool isDisabled;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Widget? icon;
  final IconPosition iconPosition;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = AppButtonStyle.primary,
    this.size = AppButtonSize.medium,
    this.width,
    this.isLoading = false,
    this.isDisabled = false,
    this.textAlign = TextAlign.center,
    this.padding,
    this.borderRadius,
    this.icon,
    this.iconPosition = IconPosition.start,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled || onPressed == null || isLoading;

    return Opacity(
      opacity: isButtonDisabled ? 0.6 : 1.0,
      child: SizedBox(
        width: width,
        child: TextButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: _getButtonStyle(context),
          child: _ButtonContent(
            isLoading: isLoading,
            size: size,
            style: style,
            text: text,
            textAlign: textAlign,
            icon: icon,
            iconPosition: iconPosition,
          ),
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    final baseStyle = TextButton.styleFrom(
      padding: padding ?? size.padding,
      shape: RoundedRectangleBorder(borderRadius: borderRadius ?? size.borderRadius),
      minimumSize: size.minimumSize,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    return switch (style) {
      AppButtonStyle.primary => baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.colors.primary.withAlpha(77);
          }
          return context.colors.primary;
        }),
        foregroundColor: WidgetStateProperty.all(context.colors.onPrimary),
      ),

      AppButtonStyle.secondary => baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.colors.secondary.withAlpha(77);
          }
          return context.colors.secondary;
        }),
        foregroundColor: WidgetStateProperty.all(context.colors.onPrimary),
      ),

      AppButtonStyle.outline => baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.colors.onPrimary.withAlpha(77);
          }
          return context.colors.primary;
        }),
        side: WidgetStateProperty.all(
          BorderSide(
            color: isDisabled ? context.colors.onPrimary.withAlpha(77) : context.colors.primary,
            width: 1.5,
          ),
        ),
      ),

      AppButtonStyle.text => baseStyle.copyWith(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return context.colors.onPrimary.withAlpha(77);
          }
          return context.colors.primary;
        }),
      ),
    };
  }
}

class _ButtonContent extends StatelessWidget {
  final bool isLoading;
  final AppButtonSize size;
  final AppButtonStyle style;
  final String text;
  final TextAlign textAlign;
  final Widget? icon;
  final IconPosition iconPosition;

  const _ButtonContent({
    required this.isLoading,
    required this.size,
    required this.style,
    required this.text,
    required this.textAlign,
    required this.icon,
    required this.iconPosition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: size.iconSize,
        width: size.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            style == AppButtonStyle.outline || style == AppButtonStyle.text
                ? context.colors.primary
                : context.colors.onPrimary,
          ),
        ),
      );
    }

    final textWidget = Text(text, textAlign: textAlign, style: size.getTextStyle(context));

    if (icon == null) return textWidget;

    final iconWidget = SizedBox(height: size.iconSize, width: size.iconSize, child: icon!);

    return switch (iconPosition) {
      IconPosition.start => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          SizedBox(width: AppConstants.paddingSmall),
          textWidget,
        ],
      ),
      IconPosition.end => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget,
          SizedBox(width: AppConstants.paddingSmall),
          iconWidget,
        ],
      ),
    };
  }
}
