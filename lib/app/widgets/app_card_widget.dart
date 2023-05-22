import 'package:cloud_walk_test/app/styles/app_color_scheme.dart';
import 'package:cloud_walk_test/app/styles/app_corner_radius.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;

  const AppCardWidget({
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color ?? AppColorScheme.primaryBackground,
            borderRadius: borderRadius ?? const BorderRadius.all(AppCornerRadius.medium),
            border: Border.all(
              color: borderColor ?? AppColorScheme.border,
              width: borderWidth ?? 1,
            ),
          ),
          child: child,
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<VoidCallback>('onTap', onTap));
    properties.add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(ColorProperty('color', color));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(DoubleProperty('borderWidth', borderWidth));
  }
}
