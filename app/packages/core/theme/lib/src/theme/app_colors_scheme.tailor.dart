// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_colors_scheme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppColorsTailorMixin on ThemeExtension<AppColors> {
  Color get primaryColor;
  Color get onPrimaryColor;
  Color get secondaryColor;
  Color get onSecondaryColor;
  Color get primaryContainerColor;
  Color get onPrimaryContainerColor;
  Color get secondaryContainerColor;
  Color get onSecondaryContainerColor;
  Color get errorColor;
  Color get onErrorColor;
  Color get surfaceColor;
  Color get onSurfaceColor;
  Color get backgroundColor;

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? onPrimaryColor,
    Color? secondaryColor,
    Color? onSecondaryColor,
    Color? primaryContainerColor,
    Color? onPrimaryContainerColor,
    Color? secondaryContainerColor,
    Color? onSecondaryContainerColor,
    Color? errorColor,
    Color? onErrorColor,
    Color? surfaceColor,
    Color? onSurfaceColor,
    Color? backgroundColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      onPrimaryColor: onPrimaryColor ?? this.onPrimaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      onSecondaryColor: onSecondaryColor ?? this.onSecondaryColor,
      primaryContainerColor:
          primaryContainerColor ?? this.primaryContainerColor,
      onPrimaryContainerColor:
          onPrimaryContainerColor ?? this.onPrimaryContainerColor,
      secondaryContainerColor:
          secondaryContainerColor ?? this.secondaryContainerColor,
      onSecondaryContainerColor:
          onSecondaryContainerColor ?? this.onSecondaryContainerColor,
      errorColor: errorColor ?? this.errorColor,
      onErrorColor: onErrorColor ?? this.onErrorColor,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      onSurfaceColor: onSurfaceColor ?? this.onSurfaceColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this as AppColors;
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      onPrimaryColor: Color.lerp(onPrimaryColor, other.onPrimaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      onSecondaryColor: Color.lerp(
        onSecondaryColor,
        other.onSecondaryColor,
        t,
      )!,
      primaryContainerColor: Color.lerp(
        primaryContainerColor,
        other.primaryContainerColor,
        t,
      )!,
      onPrimaryContainerColor: Color.lerp(
        onPrimaryContainerColor,
        other.onPrimaryContainerColor,
        t,
      )!,
      secondaryContainerColor: Color.lerp(
        secondaryContainerColor,
        other.secondaryContainerColor,
        t,
      )!,
      onSecondaryContainerColor: Color.lerp(
        onSecondaryContainerColor,
        other.onSecondaryContainerColor,
        t,
      )!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      onErrorColor: Color.lerp(onErrorColor, other.onErrorColor, t)!,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      onSurfaceColor: Color.lerp(onSurfaceColor, other.onSurfaceColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(
              primaryColor,
              other.primaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              onPrimaryColor,
              other.onPrimaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              secondaryColor,
              other.secondaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              onSecondaryColor,
              other.onSecondaryColor,
            ) &&
            const DeepCollectionEquality().equals(
              primaryContainerColor,
              other.primaryContainerColor,
            ) &&
            const DeepCollectionEquality().equals(
              onPrimaryContainerColor,
              other.onPrimaryContainerColor,
            ) &&
            const DeepCollectionEquality().equals(
              secondaryContainerColor,
              other.secondaryContainerColor,
            ) &&
            const DeepCollectionEquality().equals(
              onSecondaryContainerColor,
              other.onSecondaryContainerColor,
            ) &&
            const DeepCollectionEquality().equals(
              errorColor,
              other.errorColor,
            ) &&
            const DeepCollectionEquality().equals(
              onErrorColor,
              other.onErrorColor,
            ) &&
            const DeepCollectionEquality().equals(
              surfaceColor,
              other.surfaceColor,
            ) &&
            const DeepCollectionEquality().equals(
              onSurfaceColor,
              other.onSurfaceColor,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(primaryColor),
      const DeepCollectionEquality().hash(onPrimaryColor),
      const DeepCollectionEquality().hash(secondaryColor),
      const DeepCollectionEquality().hash(onSecondaryColor),
      const DeepCollectionEquality().hash(primaryContainerColor),
      const DeepCollectionEquality().hash(onPrimaryContainerColor),
      const DeepCollectionEquality().hash(secondaryContainerColor),
      const DeepCollectionEquality().hash(onSecondaryContainerColor),
      const DeepCollectionEquality().hash(errorColor),
      const DeepCollectionEquality().hash(onErrorColor),
      const DeepCollectionEquality().hash(surfaceColor),
      const DeepCollectionEquality().hash(onSurfaceColor),
      const DeepCollectionEquality().hash(backgroundColor),
    );
  }
}

extension AppColorsBuildContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
