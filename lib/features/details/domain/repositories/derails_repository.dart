import '../../../../core/networking/api_result.dart';
import '../../../home/domain/entities/breed.dart';

abstract class DetailsRepository {
  Future<ApiResult<Breed>> getBreedDetails(String petId);
}
