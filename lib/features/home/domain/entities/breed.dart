class Breed {
  Weight weight;
  String id;
  String name;
  String temperament;
  String origin;
  String description;
  String lifeSpan;
  String? referenceImageId;

  Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    this.referenceImageId,
  });
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});
}
