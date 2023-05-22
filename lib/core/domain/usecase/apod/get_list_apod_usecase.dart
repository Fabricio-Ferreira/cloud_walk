import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:cloud_walk_test/core/domain/repository/apod_repository.dart';
import 'package:cloud_walk_test/core/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetListApodUsecase extends UseCase<List<ApodEntity>, GetListApodParams> {
  final ApodRepository _repository;

  GetListApodUsecase(this._repository);

  @override
  Future<Either<Exception, List<ApodEntity>>> call(GetListApodParams params) =>
      _repository.getApodList(params);
}
