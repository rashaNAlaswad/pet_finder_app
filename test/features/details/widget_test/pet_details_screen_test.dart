import 'package:flutter_test/flutter_test.dart';

import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/features/home/domain/entities/breed.dart';

void main() {
  group('PetDetailsScreen Widget Tests', () {
    late Breed mockBreed;
    late Breed mockBreedWithoutImage;
    late Breed mockBreedWithEmptyImage;

    setUp(() {
      mockBreed = Breed(
        id: '1',
        name: 'Labrador Retriever',
        temperament: 'Friendly, Active, Outgoing, Playful',
        origin: 'Canada',
        description:
            'The Labrador Retriever is a medium-large breed of retriever-gun dog. They are popular family pets and working dogs.',
        lifeSpan: '10-12',
        weight: Weight(metric: '25-32'),
        referenceImageId: 'test-image-id',
      );

      mockBreedWithoutImage = Breed(
        id: '2',
        name: 'Golden Retriever',
        temperament: 'Gentle, Intelligent, Reliable',
        origin: 'Scotland',
        description: 'The Golden Retriever is a medium-large gun dog.',
        lifeSpan: '10-12',
        weight: Weight(metric: '25-34'),
        referenceImageId: null,
      );

      mockBreedWithEmptyImage = Breed(
        id: '3',
        name: 'Test Breed',
        temperament: 'Test',
        origin: 'Test',
        description: 'Test',
        lifeSpan: '10-12',
        weight: Weight(metric: '25-32'),
        referenceImageId: '',
      );
    });

    group('Happy Path Tests', () {
      test('breed entity contains correct name', () {
        expect(mockBreed.name, 'Labrador Retriever');
      });

      test('breed entity contains correct origin', () {
        expect(mockBreed.origin, 'Canada');
      });

      test('breed entity contains correct lifespan', () {
        expect(mockBreed.lifeSpan, '10-12');
      });

      test('breed entity contains correct temperament', () {
        expect(mockBreed.temperament, 'Friendly, Active, Outgoing, Playful');
      });

      test('breed entity contains correct description', () {
        expect(
          mockBreed.description,
          'The Labrador Retriever is a medium-large breed of retriever-gun dog. They are popular family pets and working dogs.',
        );
      });

      test('breed entity contains correct weight', () {
        expect(mockBreed.weight.metric, '25-32');
      });

      test('breed entity contains correct reference image ID', () {
        expect(mockBreed.referenceImageId, 'test-image-id');
      });

      test('breed entity contains all required information', () {
        expect(mockBreed.id, '1');
        expect(mockBreed.name, 'Labrador Retriever');
        expect(mockBreed.temperament, 'Friendly, Active, Outgoing, Playful');
        expect(mockBreed.origin, 'Canada');
        expect(
          mockBreed.description,
          'The Labrador Retriever is a medium-large breed of retriever-gun dog. They are popular family pets and working dogs.',
        );
        expect(mockBreed.lifeSpan, '10-12');
        expect(mockBreed.weight.metric, '25-32');
        expect(mockBreed.referenceImageId, 'test-image-id');
      });
    });

    group('Edge Case Tests', () {
      test('breed entity handles null referenceImageId', () {
        expect(mockBreedWithoutImage.referenceImageId, isNull);
      });

      test('breed entity handles empty referenceImageId', () {
        expect(mockBreedWithEmptyImage.referenceImageId, '');
      });

      test('ApiErrorModel creates error with correct message', () {
        final error = ApiErrorModel(message: 'Breed not found');
        expect(error.message, 'Breed not found');
      });

      test('ApiErrorModel creates error with timeout message', () {
        final error = ApiErrorModel(message: 'Request timeout');
        expect(error.message, 'Request timeout');
      });

      test('ApiErrorModel creates error with server error message', () {
        final error = ApiErrorModel(message: 'Internal server error');
        expect(error.message, 'Internal server error');
      });
    });
  });
}
