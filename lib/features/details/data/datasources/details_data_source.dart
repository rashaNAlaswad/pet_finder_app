import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../home/data/mappers/breed_mapper.dart';
import '../../../home/domain/entities/breed.dart';

class DetailsDataSource {
  final ApiService _apiService;
  DetailsDataSource(this._apiService);

  Future<ApiResult<Breed>> getPetDetails(String petId) async {
    try {
      final response = await _apiService.getBreedById(petId);
      final petDetails = BreedMapper.toDomain(response);
      return ApiResult.success(petDetails);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
