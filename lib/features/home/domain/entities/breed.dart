class Breed {
  Weight weight;
  String id;
  String name;
  String temperament;
  String origin;
  String description;
  String lifeSpan;
  String altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int socialNeeds;
  int strangerFriendly;
  String? referenceImageId;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.altNames,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.socialNeeds,
    required this.strangerFriendly,
    this.referenceImageId,
  });
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});
}
