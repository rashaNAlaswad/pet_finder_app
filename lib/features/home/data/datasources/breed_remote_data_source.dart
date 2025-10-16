import '../../../../core/constants/api_constants.dart';
import '../mappers/breed_mapper.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/entities/breed.dart';

class BreedRemoteDataSource {
  final ApiService _apiService;
  BreedRemoteDataSource(this._apiService);

  Future<ApiResult<List<Breed>>> getBreeds({
    int limit = ApiConstants.defaultLimit,
    int page = ApiConstants.defaultPage,
  }) async {
    try {
      final response = await _apiService.getBreeds(limit: limit, page: page);
      final breeds = BreedMapper.toDomainList(response);
      return ApiResult.success(breeds);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
