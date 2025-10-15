import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
}
