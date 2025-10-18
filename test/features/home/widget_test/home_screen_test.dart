import 'package:flutter_test/flutter_test.dart';

import 'package:pet_finder_app/features/home/domain/entities/breed.dart';

void main() {
  group('Home Widget Tests', () {
    group('Breed Entity Tests', () {
      test('creates breed entity correctly', () {
        final breed = Breed(
          id: '1',
          name: 'Labrador',
          temperament: 'Friendly',
          origin: 'Canada',
          description: 'A friendly dog',
          lifeSpan: '10-12',
          weight: Weight(metric: '25-32'),
          referenceImageId: 'image1',
        );

        expect(breed.id, '1');
        expect(breed.name, 'Labrador');
        expect(breed.origin, 'Canada');
        expect(breed.temperament, 'Friendly');
        expect(breed.description, 'A friendly dog');
        expect(breed.lifeSpan, '10-12');
        expect(breed.weight.metric, '25-32');
        expect(breed.referenceImageId, 'image1');
      });
    });
  });
}
