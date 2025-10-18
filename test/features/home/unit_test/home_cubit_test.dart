import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed.dart';
import 'package:pet_finder_app/features/home/presentation/cubit/home_cubit.dart';
import '../../../mocks/mock_repositories.mocks.dart';

void main() {
  group('HomeCubit', () {
    late MockBreedRepository mockBreedRepository;
    late List<Breed> mockBreeds;

    setUp(() {
      mockBreedRepository = MockBreedRepository();

      mockBreeds = [
        Breed(
          id: '1',
          name: 'Labrador',
          temperament: 'Friendly',
          origin: 'Canada',
          description: 'A friendly dog',
          lifeSpan: '10-12',
          weight: Weight(metric: '25-32'),
          referenceImageId: 'image1',
        ),
        Breed(
          id: '2',
          name: 'Golden Retriever',
          temperament: 'Gentle',
          origin: 'Scotland',
          description: 'A gentle dog',
          lifeSpan: '10-12',
          weight: Weight(metric: '25-32'),
          referenceImageId: 'image2',
        ),
      ];
    });

    group('Initial State', () {
      test('should have initial state of HomeInitial', () {
        final homeCubit = HomeCubit(mockBreedRepository);
        expect(homeCubit.state, isA<HomeInitial>());
        homeCubit.close();
      });
    });

    group('loadHomeData', () {
      blocTest<HomeCubit, HomeState>(
        'emits [HomeLoading, HomeSuccess] when getBreeds succeeds',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) => cubit.loadHomeData(),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds,
            'breeds',
            mockBreeds,
          ),
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'emits [HomeLoading, HomeFailure] when getBreeds fails',
        build: () {
          final error = ApiErrorModel(message: 'Network error');
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.failure(error));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) => cubit.loadHomeData(),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeFailure>().having(
            (state) => state.error.message,
            'error message',
            'Network error',
          ),
        ],
      );

      test('does not emit HomeLoading when page > 0', () async {
        when(
          mockBreedRepository.getBreeds(
            limit: anyNamed('limit'),
            page: anyNamed('page'),
          ),
        ).thenAnswer((_) async => ApiResult.success(mockBreeds));

        final homeCubit = HomeCubit(mockBreedRepository);
        await homeCubit.loadHomeData(page: 1);

        verify(mockBreedRepository.getBreeds(limit: 10, page: 1)).called(1);
        homeCubit.close();
      });
    });

    group('search', () {
      blocTest<HomeCubit, HomeState>(
        'filters breeds by name when query is provided',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) async {
          await cubit.loadHomeData();
          cubit.search('Labrador');
        },
        wait: const Duration(milliseconds: 350),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
          isA<HomeSuccess>()
              .having(
                (state) => state.breeds.length,
                'filtered breeds length',
                1,
              )
              .having(
                (state) => state.breeds.first.name,
                'first breed name',
                'Labrador',
              ),
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'returns all breeds when query is empty',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) async {
          await cubit.loadHomeData();
          cubit.search('');
        },
        wait: const Duration(milliseconds: 350),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'returns all breeds when query is whitespace only',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) async {
          await cubit.loadHomeData();
          cubit.search('   ');
        },
        wait: const Duration(milliseconds: 350),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'performs case-insensitive search',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) async {
          await cubit.loadHomeData();
          cubit.search('LABRADOR');
        },
        wait: const Duration(milliseconds: 350),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'all breeds length',
            2,
          ),
          isA<HomeSuccess>().having(
            (state) => state.breeds.length,
            'filtered breeds length',
            1,
          ),
        ],
      );
    });

    group('loadNextPage', () {
      test(
        'appends new breeds to existing list when hasMore is true',
        () async {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          final homeCubit = HomeCubit(mockBreedRepository);
          await homeCubit.loadHomeData();
          await homeCubit.loadNextPage();

          expect(homeCubit.state, isA<HomeSuccess>());
          final state = homeCubit.state as HomeSuccess;
          expect(state.breeds.length, 2);
          homeCubit.close();
        },
      );

      test('does not fetch when hasMore is false', () async {
        when(
          mockBreedRepository.getBreeds(
            limit: anyNamed('limit'),
            page: anyNamed('page'),
          ),
        ).thenAnswer((_) async => ApiResult.success([mockBreeds.first]));

        final homeCubit = HomeCubit(mockBreedRepository);
        await homeCubit.loadHomeData();

        await homeCubit.loadNextPage();

        verify(mockBreedRepository.getBreeds(limit: 10, page: 0)).called(1);
        homeCubit.close();
      });

      test('does not fetch when already fetching', () async {
        when(
          mockBreedRepository.getBreeds(
            limit: anyNamed('limit'),
            page: anyNamed('page'),
          ),
        ).thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return ApiResult.success(mockBreeds);
        });

        final homeCubit = HomeCubit(mockBreedRepository);
        await homeCubit.loadHomeData();

        homeCubit.loadNextPage();

        await homeCubit.loadNextPage();

        verify(mockBreedRepository.getBreeds(limit: 10, page: 0)).called(1);
        verifyNever(mockBreedRepository.getBreeds(limit: 10, page: 1));
        homeCubit.close();
      });
    });

    group('refresh', () {
      blocTest<HomeCubit, HomeState>(
        'resets pagination and reloads data',
        build: () {
          when(
            mockBreedRepository.getBreeds(
              limit: anyNamed('limit'),
              page: anyNamed('page'),
            ),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          return HomeCubit(mockBreedRepository);
        },
        act: (cubit) => cubit.refresh(),
        expect: () => [
          isA<HomeLoading>(),
          isA<HomeSuccess>().having(
            (state) => state.breeds,
            'breeds',
            mockBreeds,
          ),
        ],
      );
    });
  });
}
