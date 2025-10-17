import '../../../../core/networking/api_result.dart';
import '../../../home/domain/entities/breed.dart';
import '../../domain/repositories/derails_repository.dart';
import '../datasources/details_data_source.dart';

class DetailsRepositoryImpl extends DetailsRepository {
  final DetailsDataSource _detailsRemoteDataSource;
  DetailsRepositoryImpl(this._detailsRemoteDataSource);
  @override
  Future<ApiResult<Breed>> getBreedDetails(String petId) {
    return _detailsRemoteDataSource.getPetDetails(petId);
  }
}
