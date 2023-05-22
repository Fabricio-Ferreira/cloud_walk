import 'package:cloud_walk_test/app/constants/constants.dart';
import 'package:cloud_walk_test/app/helper/custom_rounded_rect_slider_track_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color_scheme.dart';
import 'app_font_size.dart';
import 'app_font_weight.dart';
import 'app_spacing.dart';
import 'app_text_theme.dart';

// /// https://medium.com/flutter-community/page-transitions-using-themedata-in-flutter-c24afadb0b5d
// class AppThemeDataConfig extends ThemeDataDibbs {
//   static late final ThemeData _themeDataDark;
//   static late final ThemeData _themeDataLight;
//   static late final ThemeService _themeService;
//   static late final bool _isWidgetBook;
//   static bool _isWidgetbookDarkMode = true;

//   factory AppThemeDataConfig.init({bool isWidgetBook = false}) =>
//       AppThemeDataConfig._internal(isWidgetbook: isWidgetBook);

//   AppThemeDataConfig._internal({bool isWidgetbook = false}) {
//     _isWidgetBook = isWidgetbook;
//     _themeService = Get.find();
//     _themeDataDark = getDarkThemeData();
//     _themeDataLight = getLightThemeData();
//   }

//   static bool get appThemeModeIsDark => _isWidgetBook ? _widgetbookThemeMode : _appThemeMode;

//   static ThemeData get themeData => appThemeModeIsDark ? _themeDataDark : _themeDataLight;

//   static ThemeEnum get themeEnum => appThemeModeIsDark ? ThemeEnum.dark : ThemeEnum.light;

//   static bool get isWidgetBook => _isWidgetBook;

//   static bool get systemThemeDataIsDark {
//     final brightness = SchedulerBinding.instance.window.platformBrightness;
//     return brightness == Brightness.dark;
//   }

//   static bool get _appThemeMode => _themeService.theme == ThemeMode.system
//       ? systemThemeDataIsDark
//       : _themeService.theme == ThemeMode.dark;

//   static bool get _widgetbookThemeMode => _isWidgetbookDarkMode;

//   static void changeWidgetbookThemeMode({required bool isDarkMode}) =>
//       _isWidgetbookDarkMode = isDarkMode;
// }

ThemeData getLightThemeData() => ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: DibbsLightThemeColors.primarySwatch,
      textTheme: AppTextTheme.lightTextThemeAvenirNext,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(
            fontSize: AppFontSize.primary,
            fontWeight: AppFontWeight.semiBold,
            fontFamily: ConstantsApp.fontFamilyAvenirNext),
        unselectedLabelStyle: TextStyle(
            fontSize: AppFontSize.primary,
            fontWeight: AppFontWeight.semiBold,
            fontFamily: ConstantsApp.fontFamilyAvenirNext),
        labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.s12),
      ),
      scaffoldBackgroundColor: DibbsLightThemeColors.pageBackground,
      colorScheme: AppColorScheme.colorSchemeLight,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: DibbsLightThemeColors.positiveTextBackground,
        cursorColor: DibbsLightThemeColors.positiveText,
        selectionHandleColor: DibbsLightThemeColors.positiveText,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: DibbsLightThemeColors.pageBackground,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
        },
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: DibbsLightThemeColors.positiveText,
        inactiveTrackColor: DibbsLightThemeColors.positiveText,
        disabledActiveTrackColor: DibbsLightThemeColors.inactiveText,
        disabledInactiveTrackColor: DibbsLightThemeColors.inactiveText,
        trackShape: const CustomRoundedRectSliderTrackShape(),
        trackHeight: 4,
        thumbColor: Colors.white,
        disabledThumbColor: Colors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 12,
          elevation: 8,
        ),
        overlayColor: Colors.white.withOpacity(0.1),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            color: DibbsLightThemeColors.bodyText,
            fontSize: AppFontSize.extraLarge,
            fontFamily: ConstantsApp.fontFamilyAvenirNext,
          ),
          pickerTextStyle: TextStyle(
            color: DibbsLightThemeColors.bodyText,
            fontSize: AppFontSize.extraLarge,
            fontFamily: ConstantsApp.fontFamilyAvenirNext,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: DibbsLightThemeColors.bodyText,
      ),
      disabledColor: DibbsLightThemeColors.border,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: AppColorScheme.colorSchemeLight, textTheme: ButtonTextTheme.primary),
      unselectedWidgetColor: DibbsLightThemeColors.bodyText,
    );

ThemeData getDarkThemeData() => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      primarySwatch: DibbsDarkThemeColors.primarySwatch,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      tabBarTheme: const TabBarTheme(
        labelStyle: TextStyle(
            fontSize: AppFontSize.primary,
            fontWeight: AppFontWeight.semiBold,
            fontFamily: ConstantsApp.fontFamilyAvenirNext),
        unselectedLabelStyle: TextStyle(
            fontSize: AppFontSize.primary,
            fontWeight: AppFontWeight.semiBold,
            fontFamily: ConstantsApp.fontFamilyAvenirNext),
        labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.s12),
      ),
      textTheme: AppTextTheme.darkTextThemeAvenirNext,
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
      scaffoldBackgroundColor: DibbsDarkThemeColors.pageBackground,
      colorScheme: AppColorScheme.colorSchemeDark,
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: DibbsDarkThemeColors.positiveTextBackground,
        cursorColor: DibbsDarkThemeColors.positiveText,
        selectionHandleColor: DibbsDarkThemeColors.positiveText,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: DibbsDarkThemeColors.positiveText,
        inactiveTrackColor: DibbsDarkThemeColors.positiveText,
        disabledActiveTrackColor: DibbsDarkThemeColors.inactiveText,
        disabledInactiveTrackColor: DibbsDarkThemeColors.inactiveText,
        trackShape: const CustomRoundedRectSliderTrackShape(),
        trackHeight: 4,
        thumbColor: Colors.white,
        disabledThumbColor: Colors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 12,
          elevation: 8,
        ),
        overlayColor: Colors.white.withOpacity(0.1),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: DibbsDarkThemeColors.pageBackground,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
        },
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            color: DibbsDarkThemeColors.bodyText,
            fontSize: AppFontSize.extraLarge,
            fontFamily: ConstantsApp.fontFamilyAvenirNext,
          ),
          pickerTextStyle: TextStyle(
            color: DibbsDarkThemeColors.bodyText,
            fontSize: AppFontSize.extraLarge,
            fontFamily: ConstantsApp.fontFamilyAvenirNext,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: DibbsDarkThemeColors.bodyText,
      ),
      disabledColor: DibbsDarkThemeColors.border,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DibbsDarkThemeColors.primaryBackground,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: DibbsDarkThemeColors.bodyText,
        unselectedItemColor: DibbsDarkThemeColors.inactiveText,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: AppColorScheme.colorSchemeDark, textTheme: ButtonTextTheme.primary),
      unselectedWidgetColor: DibbsDarkThemeColors.bodyText,
    );
