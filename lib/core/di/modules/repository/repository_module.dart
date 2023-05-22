import 'package:cloud_walk_test/core/data/repository/apod_repository_impl.dart';
import 'package:cloud_walk_test/core/domain/repository/apod_repository.dart';
import 'package:get/get.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    _injectRepository();
  }

  static void _injectRepository() {
    Get.create<ApodRepository>(() => ApodRepositoryImpl(Get.find()));
  }
}
