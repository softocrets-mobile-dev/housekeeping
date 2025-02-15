import 'package:flutter/material.dart';

class ImageThemeDataExtension extends ThemeExtension<ImageThemeDataExtension> {
  final Color color;

  ImageThemeDataExtension({
    required this.color,
  });

  @override
  ThemeExtension<ImageThemeDataExtension> copyWith({Color? color}) {
    return ImageThemeDataExtension(
      color: color ?? this.color,
    );
  }

  @override
  ThemeExtension<ImageThemeDataExtension> lerp(
      covariant ThemeExtension<ImageThemeDataExtension>? other, double t) {
    if (other is! ImageThemeDataExtension) return this;
    return ImageThemeDataExtension(
      color: Color.lerp(color, other.color, t)!,
    );
  }
}
