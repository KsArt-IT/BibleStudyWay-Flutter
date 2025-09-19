import 'package:core_shared/src/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';

class AppPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool enabled;
  final double borderRadius;
  final AppTextFieldStyle type;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const AppPasswordTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.errorText,
    this.enabled = true,
    this.borderRadius = 16,
    this.type = AppTextFieldStyle.outlined,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
  });

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool _obscure = true;

  void _toggleVisibility() {
    setState(() => _obscure = !_obscure);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      autocorrect: false,
      enableSuggestions: false,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      keyboardType: widget.keyboardType,
      obscureText: _obscure,
      maxLines: 1,
      textCapitalization: TextCapitalization.none,
      cursorColor: theme.colorScheme.primary,
      cursorWidth: 1.5,
      cursorRadius: const Radius.circular(2),
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        errorText: widget.errorText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: _toggleVisibility,
          icon: Icon(
            _obscure ? Icons.visibility_off : Icons.visibility,
            color: _obscure ? theme.iconTheme.color?.withAlpha(153) : theme.colorScheme.primary,
          ),
        ),
        filled: widget.type == AppTextFieldStyle.filled,
        fillColor: widget.type == AppTextFieldStyle.filled
            ? theme.colorScheme.surfaceContainer
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: widget.type.getBorder(theme.dividerColor, widget.borderRadius),
        enabledBorder: widget.type.getBorder(theme.dividerColor, widget.borderRadius),
        focusedBorder: widget.type.getBorder(
          theme.colorScheme.primary,
          widget.borderRadius,
          border: 2.0,
        ),
        errorBorder: widget.type.getBorder(theme.colorScheme.error, widget.borderRadius),
        focusedErrorBorder: widget.type.getBorder(
          theme.colorScheme.error,
          widget.borderRadius,
          border: 2.0,
        ),
        disabledBorder: widget.type.getBorder(theme.disabledColor, widget.borderRadius),
      ),
    );
  }
}
