import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../entities/breed.dart';

abstract class BreedRepository {
  Future<ApiResult<List<Breed>>> getBreeds({
    int limit = ApiConstants.defaultLimit,
    int page = ApiConstants.defaultPage,
  });
}
