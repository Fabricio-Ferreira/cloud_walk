import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/data/adapters/apod_list_adapter.dart';

abstract class ApodRemoteDataSource {
  Future<List<ApodListAdapter>> getListApod(GetListApodParams params);
}
