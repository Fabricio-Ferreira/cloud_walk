import 'package:cloud_walk_test/core/domain/usecase/apod/get_list_apod_usecase.dart';
import 'package:get/get.dart';

class UsecaseModule {
  UsecaseModule._();

  static void init() {
    _injectApodUsecase();
  }

  static void _injectApodUsecase() {
    Get.create<GetListApodUsecase>(() => GetListApodUsecase(Get.find()));
  }
}
