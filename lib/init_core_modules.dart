import 'package:cloud_walk_test/core/di/modules/data_source/data_source_module.dart';
import 'package:cloud_walk_test/core/di/modules/repository/repository_module.dart';
import 'package:cloud_walk_test/core/di/modules/usecase/usecase_module.dart';

Future<void> initCoreModules() async {
  DataSourceModule.init();
  RepositoryModule.init();
  UsecaseModule.init();
}
