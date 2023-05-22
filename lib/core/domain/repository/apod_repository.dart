import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ApodRepository {
  Future<Either<Exception, List<ApodEntity>>> getApodList(GetListApodParams params);
}
