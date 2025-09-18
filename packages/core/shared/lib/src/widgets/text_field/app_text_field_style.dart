import 'package:flutter/material.dart';

enum AppTextFieldStyle {
  filled,
  outlined,
  underlined;

  InputBorder getBorder(Color color, double borderRadius, {double border = 1.5}) {
    return switch (this) {
      AppTextFieldStyle.outlined => OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: color, width: border),
      ),
      AppTextFieldStyle.filled => OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide.none,
      ),
      AppTextFieldStyle.underlined => UnderlineInputBorder(
        borderSide: BorderSide(color: color, width: border),
      ),
    };
  }
}
