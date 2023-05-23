import 'package:cloud_walk_test/app/pages/home/params/get_list_apod_params.dart';
import 'package:cloud_walk_test/core/domain/entity/apod_entity.dart';
import 'package:cloud_walk_test/core/domain/repository/apod_repository.dart';
import 'package:cloud_walk_test/core/domain/usecase/apod/get_list_apod_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApodRepositorySpy extends Mock implements ApodRepository {}

class GetListApodParamsSpy extends Fake implements GetListApodParams {}

void main() {
  late GetListApodUsecase getListApodUsecase;
  late ApodRepository apodRepository;

  setUpAll(() {
    apodRepository = ApodRepositorySpy();
    getListApodUsecase = GetListApodUsecase(apodRepository);
  });

  tearDownAll(() {
    apodRepository = ApodRepositorySpy();
    getListApodUsecase = GetListApodUsecase(apodRepository);
  });

  group('GetListApodUsecase', () {
    final params = GetListApodParams(
        title: 'title', dateInitial: '12/12/2022', count: 1, dateFinal: DateTime.now().toString());
    test('should be a subclass of GetListApodUsecase', () {
      expect(getListApodUsecase, isA<GetListApodUsecase>());
    });
    test('should get list APOD', () async {
      when(() => apodRepository.getApodList(params))
          .thenAnswer((_) async => const Right(<ApodEntity>[]));

      final result = await getListApodUsecase(params);

      verify(() => apodRepository.getApodList(params)).called(1);
      result.fold((err) => fail('Error: $err'), (a) => expect(a, isA<List<ApodEntity>>()));
      expect(result, isA<Right>());
    });

    test('should error on get List of APoDs', () async {
      try {
        when(() => apodRepository.getApodList(params)).thenAnswer((_) async => throw Exception());
        await getListApodUsecase(params);
        verify(() => apodRepository.getApodList(params)).called(1);
      } on Exception catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
