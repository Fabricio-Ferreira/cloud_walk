import 'package:cloud_walk_test/app/constants/constants.dart';
import 'package:cloud_walk_test/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => lightTextThemeAvenirNext;

  static TextTheme lightTextThemeAvenirNext = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: DibbsLightThemeColors.bodyText,
    ),
    displayMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 60,
      fontWeight: FontWeight.w300,
      color: DibbsLightThemeColors.bodyText,
    ),
    displaySmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: DibbsLightThemeColors.bodyText,
    ),
    headlineMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: DibbsLightThemeColors.bodyText,
    ),
    headlineSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: DibbsLightThemeColors.bodyText,
    ),
    titleLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: DibbsLightThemeColors.bodyText,
    ),
    titleMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: DibbsLightThemeColors.bodyText,
    ),
    titleSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: DibbsLightThemeColors.bodyText,
    ),
    bodyLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: DibbsLightThemeColors.bodyText,
    ),
    bodyMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      color: DibbsLightThemeColors.bodyText,
    ),
    labelLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: DibbsLightThemeColors.bodyText,
    ),
    bodySmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: DibbsLightThemeColors.bodyText,
    ),
    labelSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: DibbsLightThemeColors.bodyText,
    ),
  );

  static TextTheme darkTextThemeAvenirNext = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 96,
      fontWeight: FontWeight.w300,
      color: DibbsDarkThemeColors.bodyText,
    ),
    displayMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 60,
      fontWeight: FontWeight.w300,
      color: DibbsDarkThemeColors.bodyText,
    ),
    displaySmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: DibbsDarkThemeColors.bodyText,
    ),
    headlineMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 34,
      fontWeight: FontWeight.w400,
      color: DibbsDarkThemeColors.bodyText,
    ),
    headlineSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: DibbsDarkThemeColors.bodyText,
    ),
    titleLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: DibbsDarkThemeColors.bodyText,
    ),
    titleMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: DibbsDarkThemeColors.bodyText,
    ),
    titleSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: DibbsDarkThemeColors.bodyText,
    ),
    bodyLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: DibbsDarkThemeColors.bodyText,
    ),
    bodyMedium: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 16,
      color: DibbsDarkThemeColors.bodyText,
    ),
    labelLarge: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: DibbsDarkThemeColors.bodyText,
    ),
    bodySmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: DibbsDarkThemeColors.bodyText,
    ),
    labelSmall: TextStyle(
      fontFamily: ConstantsApp.fontFamilyAvenirNext,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: DibbsDarkThemeColors.bodyText,
    ),
  );
}
