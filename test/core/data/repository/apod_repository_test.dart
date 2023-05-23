import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/data/adapters/apod_list_adapter.dart';
import 'package:cloud_walk_test/core/data/data_source/apod/apod_remote_data_source.dart';
import 'package:cloud_walk_test/core/data/repository/apod_repository_impl.dart';
import 'package:cloud_walk_test/core/domain/repository/apod_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApodRemoteDataSourceSpy extends Mock implements ApodRemoteDataSource {}

void main() {
  late final ApodRemoteDataSource remoteDataSource;

  late ApodRepository repository;

  setUpAll(() {
    remoteDataSource = ApodRemoteDataSourceSpy();
    repository = ApodRepositoryImpl(remoteDataSource);
  });

  tearDown(() {
    reset(remoteDataSource);
  });

  group('APoD repository implementation', () {
    group('get List APoDs', () {
      final params = GetListApodParams(
        title: 'title',
        dateInitial: '12/12/2022',
        count: 1,
        dateFinal: DateTime.now().toString(),
      );
      test('should return a success response', () async {
        //arrange
        when(() => remoteDataSource.getListApod(params))
            .thenAnswer((_) => Future.value(<ApodListAdapter>[]));

        //act
        final result = await repository.getApodList(params);

        //assert
        expect(result.isRight(), true);
      });
    });
  });
}
