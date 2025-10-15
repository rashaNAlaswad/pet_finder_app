import 'package:json_annotation/json_annotation.dart';

part 'breed_response.g.dart';

@JsonSerializable()
class BreedResponse {
  final Weight weight;
  final String id;
  final String name;
  @JsonKey(name: 'cfa_url')
  final String? cfaUrl;
  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;
  @JsonKey(name: 'vcahospitals_url')
  final String? vcahospitalsUrl;
  final String temperament;
  final String origin;
  @JsonKey(name: 'country_codes')
  final String countryCodes;
  @JsonKey(name: 'country_code')
  final String countryCode;
  final String description;
  @JsonKey(name: 'life_span')
  final String lifeSpan;
  final int? indoor;
  final int? lap;
  @JsonKey(name: 'alt_names')
  final String? altNames;
  final int adaptability;
  @JsonKey(name: 'affection_level')
  final int affectionLevel;
  @JsonKey(name: 'child_friendly')
  final int childFriendly;
  @JsonKey(name: 'cat_friendly')
  final int? catFriendly;
  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;
  @JsonKey(name: 'energy_level')
  final int energyLevel;
  final int grooming;
  @JsonKey(name: 'health_issues')
  final int healthIssues;
  final int intelligence;
  @JsonKey(name: 'shedding_level')
  final int sheddingLevel;
  @JsonKey(name: 'social_needs')
  final int socialNeeds;
  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;
  final int vocalisation;
  @JsonKey(name: 'bidability')
  final int? bidability;
  final int experimental;
  final int hairless;
  final int natural;
  final int rare;
  final int rex;
  @JsonKey(name: 'suppressed_tail')
  final int suppressedTail;
  @JsonKey(name: 'short_legs')
  final int shortLegs;
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;
  final int hypoallergenic;
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  BreedResponse({
    required this.weight,
    required this.id,
    required this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    this.catFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    this.bidability,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    this.wikipediaUrl,
    required this.hypoallergenic,
    this.referenceImageId,
  });

  factory BreedResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedResponseFromJson(json);
}

@JsonSerializable()
class Weight {
  final String imperial;
  final String metric;

  Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
