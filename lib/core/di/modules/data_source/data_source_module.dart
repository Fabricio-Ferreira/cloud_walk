import 'package:cloud_walk_test/core/data/data_source/apod/apod_remote_data_source.dart';
import 'package:cloud_walk_test/core/data/data_source/apod/apod_remote_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DataSourceModule {
  DataSourceModule._();

  static void init() {
    Get.lazyPut(Dio.new);
    Get.create<ApodRemoteDataSource>(() => ApodRemoteDataSourceImpl(Get.find()));
  }
}
