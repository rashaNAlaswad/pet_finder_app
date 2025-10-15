import '../../../../core/networking/api_result.dart';
import '../entities/breed.dart';

abstract class BreedRepository {
  Future<ApiResult<List<Breed>>> getBreeds();
}
