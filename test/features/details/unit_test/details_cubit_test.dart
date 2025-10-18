import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/details/presentation/cubit/details_cubit.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed.dart';
import '../../../mocks/mock_repositories.mocks.dart';

void main() {
  group('DetailsCubit', () {
    late DetailsCubit detailsCubit;
    late MockDetailsRepository mockDetailsRepository;
    late Breed mockBreed;

    setUp(() {
      mockDetailsRepository = MockDetailsRepository();
      detailsCubit = DetailsCubit(mockDetailsRepository);

      mockBreed = Breed(
        id: '1',
        name: 'Labrador Retriever',
        temperament: 'Friendly, Active, Outgoing',
        origin: 'Canada',
        description:
            'The Labrador Retriever is a medium-large breed of retriever-gun dog.',
        lifeSpan: '10-12',
        weight: Weight(metric: '25-32'),
        referenceImageId: 'image1',
      );
    });

    tearDown(() {
      detailsCubit.close();
    });

    group('Initial State', () {
      test('should have initial state of DetailsInitial', () {
        expect(detailsCubit.state, isA<DetailsInitial>());
      });
    });

    group('loadBreedDetails', () {
      blocTest<DetailsCubit, DetailsState>(
        'emits [DetailsLoading, DetailsSuccess] when getBreedDetails succeeds',
        build: () {
          when(
            mockDetailsRepository.getBreedDetails(any),
          ).thenAnswer((_) async => ApiResult.success(mockBreed));
          return detailsCubit;
        },
        act: (cubit) => cubit.loadBreedDetails('1'),
        expect: () => [
          isA<DetailsLoading>(),
          isA<DetailsSuccess>().having(
            (state) => state.breed,
            'breed',
            mockBreed,
          ),
        ],
      );

      blocTest<DetailsCubit, DetailsState>(
        'emits [DetailsLoading, DetailsFailure] when getBreedDetails fails',
        build: () {
          final error = ApiErrorModel(message: 'Breed not found');
          when(
            mockDetailsRepository.getBreedDetails(any),
          ).thenAnswer((_) async => ApiResult.failure(error));
          return detailsCubit;
        },
        act: (cubit) => cubit.loadBreedDetails('invalid_id'),
        expect: () => [
          isA<DetailsLoading>(),
          isA<DetailsFailure>().having(
            (state) => state.error.message,
            'error message',
            'Breed not found',
          ),
        ],
      );

      test('calls repository with correct petId', () async {
        when(
          mockDetailsRepository.getBreedDetails(any),
        ).thenAnswer((_) async => ApiResult.success(mockBreed));

        await detailsCubit.loadBreedDetails('test_id');

        verify(mockDetailsRepository.getBreedDetails('test_id')).called(1);
      });

      test('handles network timeout error', () async {
        final error = ApiErrorModel(message: 'Request timeout');
        when(
          mockDetailsRepository.getBreedDetails(any),
        ).thenAnswer((_) async => ApiResult.failure(error));

        await detailsCubit.loadBreedDetails('1');

        expect(detailsCubit.state, isA<DetailsFailure>());
        final failureState = detailsCubit.state as DetailsFailure;
        expect(failureState.error.message, 'Request timeout');
      });

      test('handles server error', () async {
        final error = ApiErrorModel(message: 'Internal server error');
        when(
          mockDetailsRepository.getBreedDetails(any),
        ).thenAnswer((_) async => ApiResult.failure(error));

        await detailsCubit.loadBreedDetails('1');

        expect(detailsCubit.state, isA<DetailsFailure>());
        final failureState = detailsCubit.state as DetailsFailure;
        expect(failureState.error.message, 'Internal server error');
      });

      test('handles empty petId', () async {
        final error = ApiErrorModel(message: 'Invalid breed ID');
        when(
          mockDetailsRepository.getBreedDetails(any),
        ).thenAnswer((_) async => ApiResult.failure(error));

        await detailsCubit.loadBreedDetails('');

        verify(mockDetailsRepository.getBreedDetails('')).called(1);
        expect(detailsCubit.state, isA<DetailsFailure>());
      });
    });
  });
}
