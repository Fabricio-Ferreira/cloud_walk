import 'package:cloud_walk_test/app/constants/constants.dart';
import 'package:cloud_walk_test/app/styles/app_color_scheme.dart';
import 'package:cloud_walk_test/app/styles/app_font_weight.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const String fontFamily = ConstantsApp.fontFamilyAvenirNext;

  /// example:
  /// Text(L10n.current.depositAmount_emailVerificationSent_message,
  ///      style: AppTextStyle.bodyTextLarge(),
  /// )
  ///
  /// example change color
  /// Text(L10n.current.depositAmount_emailVerificationSent_message,
  ///      style: AppTextStyle.bodyTextLarge(color: AppColorScheme.attention)
  /// )
  ///
  /// example change other property
  /// Text(L10n.current.depositAmount_emailVerificationSent_message,
  ///      style: AppTextStyle.bodyTextLarge().copyWith(fontSize:30)
  /// )
  ///
  /// height - When height is non-null, the line height of the span of text will
  /// be a multiple of fontSize and be exactly
  /// fontSize * height logical pixels tall.

  static TextStyle appDefault({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
      );

  static TextStyle headlineXLarge({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 48,
        height: 1.12,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle headlineLarge({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 30,
        height: 1.2,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle headlineMedium({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 28,
        height: 1.21,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle headlineSmall({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 24,
        height: 1.16,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle subHeadlineLarge({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 20,
        height: 1.2,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle subHeadlineXMedium({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 20,
        height: 1.2,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle subHeadlineMedium({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 18,
        height: 1.22,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle subHeadlineSmall({Color? color, double? height}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.medium,
        fontSize: 16,
        height: 1.25,
      ).copyWith(color: color ?? AppColorScheme.bodyText, height: height);

  static TextStyle subHeadlineXSmall({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 16,
        height: 1.25,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextXLarge({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 14,
        height: 1.42,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextLarge({
    Color? color,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: textDecoration ?? TextDecoration.none,
        fontWeight: AppFontWeight.medium,
        fontSize: 14,
        height: 1.42,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextXMedium({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 12,
        height: 1.5,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextMedium({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.medium,
        fontSize: 12,
        height: 1.5,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyText({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.regular,
        fontSize: 12,
        height: 1.5,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextXSmall({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.semiBold,
        fontSize: 10,
        height: 1.4,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextSmall({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.bold,
        fontSize: 10,
        height: 1.4,
      ).copyWith(color: color ?? AppColorScheme.bodyText);

  static TextStyle bodyTextXSpace({Color? color}) => TextStyle(
        color: color ?? AppColorScheme.bodyText,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        fontWeight: AppFontWeight.regular,
        fontSize: 14,
        height: 1.72,
      ).copyWith(color: color ?? AppColorScheme.bodyText);
}
