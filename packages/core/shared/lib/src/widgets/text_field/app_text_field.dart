import 'package:core_shared/src/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final AppTextFieldStyle type;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final double borderRadius;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.type = AppTextFieldStyle.outlined,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.borderRadius = 16,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      autocorrect: false,
      enableSuggestions: false,
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      cursorColor: theme.colorScheme.primary,
      cursorWidth: 1.5,
      cursorRadius: const Radius.circular(2),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: type == AppTextFieldStyle.filled,
        fillColor: type == AppTextFieldStyle.filled ? theme.colorScheme.surfaceContainer : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: type.getBorder(theme.dividerColor, borderRadius),
        enabledBorder: type.getBorder(theme.dividerColor, borderRadius),
        focusedBorder: type.getBorder(theme.colorScheme.primary, borderRadius, border: 2.0),
        errorBorder: type.getBorder(theme.colorScheme.error, borderRadius),
        focusedErrorBorder: type.getBorder(theme.colorScheme.error, borderRadius, border: 2.0),
        disabledBorder: type.getBorder(theme.disabledColor, borderRadius),
      ),
    );
  }
}
