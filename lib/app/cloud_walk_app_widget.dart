import 'dart:io';

import 'package:cloud_walk_test/app/cloud_walk_app_routes.dart';
import 'package:cloud_walk_test/app/routes/app_routes_enum.dart';
import 'package:cloud_walk_test/app/styles/app_theme.dart';
import 'package:cloud_walk_test/app/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CloudWalkAppWidget extends StatefulWidget {
  const CloudWalkAppWidget({Key? key}) : super(key: key);

  @override
  State<CloudWalkAppWidget> createState() => _CloudWalkAppWidgetState();
}

class _CloudWalkAppWidgetState extends State<CloudWalkAppWidget> with WidgetsBindingObserver {
  late final ThemeData _themeDataLight;
  late final ThemeData _themeDataDark;

  @override
  void initState() {
    _themeDataDark = getDarkThemeData();
    _themeDataLight = getLightThemeData();
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.blue.shade900,
          systemNavigationBarColor: Colors.blue.shade900,
          systemNavigationBarDividerColor: Colors.blue.shade900,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: Get.key,
        title: 'Cloud Walk - APoD',
        debugShowCheckedModeBanner: false,
        theme: _themeDataLight,
        darkTheme: _themeDataDark,
        initialRoute: AppRoutes.home.path,
        getPages: CloudWalkAppRoutes.routes,
        builder: (context, child) => Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          body: GestureDetector(
            onTap: () => WidgetUtils.hideKeyboard(context),
            child: child,
          ),
        ),
      );
}
