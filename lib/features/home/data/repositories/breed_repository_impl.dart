import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../datasources/breed_remote_data_source.dart';

class BreedRepositoryImpl extends BreedRepository {
  final BreedRemoteDataSource _breedRemoteDataSource;
  BreedRepositoryImpl(this._breedRemoteDataSource);
  @override
  Future<ApiResult<List<Breed>>> getBreeds({
    int limit = ApiConstants.defaultLimit,
    int page = ApiConstants.defaultPage,
  }) async {
    return _breedRemoteDataSource.getBreeds(limit: limit, page: page);
  }
}
