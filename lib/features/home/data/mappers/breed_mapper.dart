import '../models/breed_response.dart' hide Weight;
import '../../domain/entities/breed.dart';

class BreedMapper {
  static Breed toDomain(BreedResponse breedResponse) {
    return Breed(
      weight: Weight(
        imperial: breedResponse.weight.imperial,
        metric: breedResponse.weight.metric,
      ),
      id: breedResponse.id,
      name: breedResponse.name,
      temperament: breedResponse.temperament,
      origin: breedResponse.origin,
      description: breedResponse.description,
      lifeSpan: breedResponse.lifeSpan,
      referenceImageId: breedResponse.referenceImageId ?? '',
    );
  }

  static List<Breed> toDomainList(List<BreedResponse> breedResponses) {
    return breedResponses.map((response) => toDomain(response)).toList();
  }
}
