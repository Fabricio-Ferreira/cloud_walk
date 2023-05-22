import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/data/data_source/apod/apod_remote_data_source.dart';
import 'package:cloud_walk_test/core/data/helpers/repository_helper.dart';
import 'package:cloud_walk_test/core/data/model/app_exception.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:cloud_walk_test/core/domain/repository/apod_repository.dart';
import 'package:cloud_walk_test/core/error/dio_error_app.dart';
import 'package:cloud_walk_test/core/error/error_app.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApodRepositoryImpl implements ApodRepository {
  final ApodRemoteDataSource remoteDataSource;

  ApodRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<ApodEntity>>> getApodList(GetListApodParams params) async {
    try {
      final result = await remoteDataSource.getListApod(params);

      if (params.title.isNotEmpty) {
        final filterredList = RepositoryHelper.filterList(result, params.title);
        return Right(filterredList);
      }

      return Right(result);
    } on DioError catch (err) {
      final message = DioExceptions.fromDioError(err).toString();
      return Left(DioFailure(message));
    } on ErrorApp catch (e) {
      return Left(AppException(description: e.message));
    }
  }
}
