import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/details/data/datasources/details_data_source.dart';
import '../../features/details/data/repositories/details_repository_impl.dart';
import '../../features/details/domain/repositories/derails_repository.dart';
import '../../features/details/presentation/cubit/details_cubit.dart';
import '../../features/home/data/datasources/breed_remote_data_source.dart';
import '../../features/home/data/repositories/breed_repository_impl.dart';
import '../../features/home/domain/repositories/breed_repository.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

setupGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // breed
  getIt.registerLazySingleton<BreedRemoteDataSource>(
    () => BreedRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<BreedRepository>(
    () => BreedRepositoryImpl(getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // details
  getIt.registerLazySingleton<DetailsDataSource>(
    () => DetailsDataSource(getIt()),
  );
  getIt.registerLazySingleton<DetailsRepository>(
    () => DetailsRepositoryImpl(getIt()),
  );
  getIt.registerFactory<DetailsCubit>(() => DetailsCubit(getIt()));
}
