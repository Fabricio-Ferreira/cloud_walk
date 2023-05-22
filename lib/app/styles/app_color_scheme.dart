import 'dart:ui';

import 'package:cloud_walk_test/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static bool get systemThemeDataIsDark {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    return brightness == Brightness.dark;
  }
}

class AppColorScheme {
  static Color get bodyText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.bodyText
      : DibbsLightThemeColors.bodyText;

  static Color get border => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.border
      : DibbsLightThemeColors.border;

  static Color get pageBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.pageBackground
      : DibbsLightThemeColors.pageBackground;

  static Color get primaryBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.primaryBackground
      : DibbsLightThemeColors.primaryBackground;

  static Color get inactiveText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.inactiveText
      : DibbsLightThemeColors.inactiveText;

  static Color get primaryButtonBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.primaryButtonBackground
      : DibbsLightThemeColors.primaryButtonBackground;

  static Color get activeNavBorder => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.activeNavBorder
      : DibbsLightThemeColors.activeNavBorder;

  static Color get positiveText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.positiveText
      : DibbsLightThemeColors.positiveText;

  static Color get positiveTextBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.positiveTextBackground
      : DibbsLightThemeColors.positiveTextBackground;

  static Color get iconBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.iconBackground
      : DibbsLightThemeColors.iconBackground;

  static Color get negativeText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.negativeText
      : DibbsLightThemeColors.negativeText;

  static Color get negativeTextBackground => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.negativeTextBackground
      : DibbsLightThemeColors.negativeTextBackground;

  static Color get shimmerBaseColor => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.shimmerBaseColor
      : DibbsLightThemeColors.shimmerBaseColor;

  static Color get shimmerHighlightColor => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.shimmerHighlightColor
      : DibbsLightThemeColors.shimmerHighlightColor;

  static Color get attention => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.attention
      : DibbsLightThemeColors.attention;

  static Color get textLink => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.textLink
      : DibbsLightThemeColors.textLink;

  static Color get gray =>
      AppThemeData.systemThemeDataIsDark ? DibbsDarkThemeColors.gray : DibbsLightThemeColors.gray;

  static Color get gray2 => AppThemeData.systemThemeDataIsDark
      ? DibbsLightThemeColors.border
      : DibbsDarkThemeColors.border;

  static Color get grey300 => const Color(0xFF999999);

  static Color get shadow => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.shadow
      : DibbsLightThemeColors.shadow;

  static Color get tertiaryTransactionText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.tertiaryTransactionText
      : DibbsLightThemeColors.tertiaryTransactionText;

  static Color get customKeyboardButtonColor => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.customKeyboardButtonColor
      : DibbsLightThemeColors.primaryBackground;

  static Color get customKeyboardBackgroungColor => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.customKeyboardBackgroundColor
      : DibbsLightThemeColors.customKeyboardBackgroundColor;

  static Color get pendingTransactionText => AppThemeData.systemThemeDataIsDark
      ? DibbsDarkThemeColors.pendingTransactionText
      : DibbsLightThemeColors.pendingTransactionText;

  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: DibbsLightThemeColors.pageBackground,
    accentColor: DibbsLightThemeColors.accentColor,
    primarySwatch: DibbsLightThemeColors.primarySwatch,
    cardColor: DibbsLightThemeColors.primaryBackground,
    errorColor: DibbsLightThemeColors.negativeText,
  );

  static final ColorScheme colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: DibbsDarkThemeColors.pageBackground,
    accentColor: DibbsDarkThemeColors.accentColor,
    primarySwatch: DibbsDarkThemeColors.primarySwatch,
    cardColor: DibbsDarkThemeColors.primaryBackground,
    errorColor: DibbsDarkThemeColors.negativeText,
  );

  static MaterialColor get primarySwatchLight => DibbsLightThemeColors.primarySwatch;

  static MaterialColor get primarySwatchDark => DibbsDarkThemeColors.primarySwatch;

  static MaterialColor get accentColorLight => DibbsLightThemeColors.accentColor;

  static MaterialColor get accentColorDark => DibbsDarkThemeColors.accentColor;
}

class DibbsDarkThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(positiveText);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(positiveText);

  static const pageBackground = Color(0xFF000000);
  static const primaryBackground = Color(0xFF1E1E1E);
  static const gray = Color(0xFFF9F9F9);
  static const shadow = Color(0x4BFFFFFF);
  static const border = Color(0xFF343434);
  static const bodyText = Color(0xFFFFFFFF);
  static const inactiveText = Color(0x66FFFFFF);
  static const activeNavBorder = Color(0xFF00FFAA);
  static const textLink = Color(0xFF00FFAA);
  static const primaryButtonBackground = Color(0xFF00FFAA);
  static const iconBackground = Color(0xFF1B342C);
  static const positiveText = Color(0xFF74DBB5);
  static const positiveTextBackground = Color(0xFF1B342C);
  static const negativeText = Color(0xFFEE3256);
  static const negativeTextBackground = Color(0xFF250A0F);
  static const shimmerBaseColor = Color(0xFF000000);
  static const shimmerHighlightColor = Color(0xFF1E1E1E);
  static const attention = Color(0xFFF2C94C);
  static const tertiaryTransactionText = Color(0xFF5EBBEF);
  static const customKeyboardButtonColor = Color(0xFF5A5A5A);
  static const customKeyboardBackgroundColor = Color(0xFF202020);
  static const pendingTransactionText = Color(0xFFEFC900);
}

class DibbsLightThemeColors {
  static final MaterialColor primarySwatch = StyleUtils.createMaterialColor(positiveText);
  static final MaterialColor accentColor = StyleUtils.createMaterialColor(positiveText);

  static const pageBackground = Color(0xFFF9F9F9);
  static const primaryBackground = Color(0xFFFFFFFF);
  static const gray = Color(0xFFF9F9F9);
  static const shadow = Color(0x4B000000);
  static const border = Color(0xFFE0E0E0);
  static const bodyText = Color(0xFF000000);
  static const inactiveText = Color(0xFF999999);
  static const activeNavBorder = Color(0xFF218665);
  static const textLink = Color(0xFF00FFAA);
  static const primaryButtonBackground = Color(0xFF1E1E1E);
  static const iconBackground = Color(0xFFE3F8F0);
  static const positiveText = Color(0xFF218665);
  static const positiveTextBackground = Color(0xFFE3F8F0);
  static const negativeText = Color(0xFFCF3E5A);
  static const negativeTextBackground = Color(0xFFF7F0F1);
  static const shimmerBaseColor = Color(0xFFF9F9F9);
  static const shimmerHighlightColor = Color(0xFFE0E0E0);
  static const attention = Color(0xFFD3B042);
  static const tertiaryTransactionText = Color(0xFF1E6ED4);
  static const customKeyboardBackgroundColor = Color(0xFFD2D5DB);
  static const pendingTransactionText = Color(0xFF8D6F16);
}
