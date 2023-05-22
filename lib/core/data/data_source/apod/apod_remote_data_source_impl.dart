import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/constants/constants.dart';
import 'package:cloud_walk_test/core/data/adapters/apod_list_adapter.dart';
import 'package:cloud_walk_test/core/data/data_source/apod/apod_remote_data_source.dart';
import 'package:cloud_walk_test/core/data/helpers/data_source_helper.dart';
import 'package:cloud_walk_test/core/data/networking/custom_dio.dart';
import 'package:dio/dio.dart';

class ApodRemoteDataSourceImpl implements ApodRemoteDataSource {
  Dio dio = CustomDio().instance;

  ApodRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ApodListAdapter>> getListApod(GetListApodParams params) async {
    final Map<String, dynamic> queryParameters = {};
    queryParameters.addAll({'api_key': ConstantsCore.apiKey});
    queryParameters.addAll(DataSourceHelper.getQuertyParameters(params));

    final response = await dio.get<List>(
      ConstantsCore.baseUrl,
      queryParameters: queryParameters,
    );

    return response.data
            ?.map<ApodListAdapter>(
              // ignore: unnecessary_lambdas
              (list) => ApodListAdapter.fromJson(list),
            )
            .toList() ??
        [];
  }
}
