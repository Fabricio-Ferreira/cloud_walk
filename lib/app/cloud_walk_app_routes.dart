import 'package:cloud_walk_test/app/pages/apod_details/apod_details_bindings.dart';
import 'package:cloud_walk_test/app/pages/apod_details/apod_details_page.dart';
import 'package:cloud_walk_test/app/pages/home/home_bindings.dart';
import 'package:cloud_walk_test/app/pages/home/home_page.dart';
import 'package:cloud_walk_test/app/pages/splash/splash_bindings.dart';
import 'package:cloud_walk_test/app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

mixin CloudWalkAppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: '/home',
      page: HomePage.new,
      bindings: [
        HomeBindings(),
      ],
    ),
    GetPage(
      name: '/',
      page: SplashPage.new,
      bindings: [
        SplashBindings(),
      ],
    ),
    GetPage(
      name: '/apod-details',
      page: ApodDetailsPage.new,
      bindings: [
        ApodDetailsBindings(),
      ],
    ),
  ];
}
