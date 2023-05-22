import 'dart:async';

import 'package:cloud_walk_test/app/cloud_walk_app_widget.dart';
import 'package:cloud_walk_test/init_core_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
    await initCoreModules();
    runApp(const CloudWalkAppWidget());
  });
}
