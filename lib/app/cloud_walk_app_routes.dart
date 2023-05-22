import 'package:cloud_walk_test/app/pages/home/home_bindings.dart';
import 'package:cloud_walk_test/app/pages/home/home_page.dart';
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
  ];
}
