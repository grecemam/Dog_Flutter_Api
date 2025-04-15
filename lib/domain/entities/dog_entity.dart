import 'measurement_entity.dart';

class DogEntity {
  final int id;
  final String name;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String origin;
  final String countryCode;
  final String referenceImageId;
  final MeasurementEntity weight;
  final MeasurementEntity height;

  DogEntity({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.countryCode,
    required this.referenceImageId,
    required this.weight,
    required this.height,
  });
}
