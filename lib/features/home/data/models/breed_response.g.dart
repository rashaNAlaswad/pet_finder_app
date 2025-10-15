// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedResponse _$BreedResponseFromJson(Map<String, dynamic> json) =>
    BreedResponse(
      weight: Weight.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      cfaUrl: json['cfa_url'] as String?,
      vetstreetUrl: json['vetstreet_url'] as String?,
      vcahospitalsUrl: json['vcahospitals_url'] as String?,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      countryCodes: json['country_codes'] as String,
      countryCode: json['country_code'] as String,
      description: json['description'] as String,
      lifeSpan: json['life_span'] as String,
      indoor: (json['indoor'] as num?)?.toInt(),
      lap: (json['lap'] as num?)?.toInt(),
      altNames: json['alt_names'] as String?,
      adaptability: (json['adaptability'] as num).toInt(),
      affectionLevel: (json['affection_level'] as num).toInt(),
      childFriendly: (json['child_friendly'] as num).toInt(),
      catFriendly: (json['cat_friendly'] as num?)?.toInt(),
      dogFriendly: (json['dog_friendly'] as num).toInt(),
      energyLevel: (json['energy_level'] as num).toInt(),
      grooming: (json['grooming'] as num).toInt(),
      healthIssues: (json['health_issues'] as num).toInt(),
      intelligence: (json['intelligence'] as num).toInt(),
      sheddingLevel: (json['shedding_level'] as num).toInt(),
      socialNeeds: (json['social_needs'] as num).toInt(),
      strangerFriendly: (json['stranger_friendly'] as num).toInt(),
      vocalisation: (json['vocalisation'] as num).toInt(),
      bidability: (json['bidability'] as num?)?.toInt(),
      experimental: (json['experimental'] as num).toInt(),
      hairless: (json['hairless'] as num).toInt(),
      natural: (json['natural'] as num).toInt(),
      rare: (json['rare'] as num).toInt(),
      rex: (json['rex'] as num).toInt(),
      suppressedTail: (json['suppressed_tail'] as num).toInt(),
      shortLegs: (json['short_legs'] as num).toInt(),
      wikipediaUrl: json['wikipedia_url'] as String?,
      hypoallergenic: (json['hypoallergenic'] as num).toInt(),
      referenceImageId: json['reference_image_id'] as String?,
    );

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
  imperial: json['imperial'] as String,
  metric: json['metric'] as String,
);
