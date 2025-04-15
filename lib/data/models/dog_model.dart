import '../../domain/entities/dog_entity.dart';
import '../../domain/entities/measurement_entity.dart';
import 'measurement.dart';

class Dog {
  final int id;
  final String name;
  final String bredFor;
  final String breedGroup;
  final String lifeSpan;
  final String temperament;
  final String origin;
  final String countryCode;
  final String referenceImageId;
  final Measurement weight;
  final Measurement height;

  Dog({
    required this.id,
    required this.name,
    required this.bredFor,
    required this.breedGroup,
    required this.lifeSpan,
    required this.temperament,
    required this.origin,
    required this.referenceImageId,
    required this.weight,
    required this.countryCode,
    required this.height,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      id: json['id'],
      name: json['name'],
      bredFor: json['bred_for'] ?? 'Неизвестно',
      breedGroup: json['breed_group'] ?? 'Неизвестно',
      lifeSpan: json['life_span'],
      countryCode: json['country_code'] ?? 'Неизвестно',
      temperament: json['temperament'] ?? 'Неизвестно',
      origin: json['origin'] ?? 'Неизвестно',
      referenceImageId: json['reference_image_id'],
      weight: Measurement.fromJson(json['weight']),
      height: Measurement.fromJson(json['height']),
    );
  }

  // Метод преобразования в сущность
  DogEntity toEntity() {
    return DogEntity(
      id: id,
      name: name,
      bredFor: bredFor,
      breedGroup: breedGroup,
      lifeSpan: lifeSpan,
      temperament: temperament,
      countryCode: countryCode,
      origin: origin,
      referenceImageId: referenceImageId,
      weight: MeasurementEntity(
        imperial: weight.imperial,
        metric: weight.metric,
      ),
      height: MeasurementEntity(
        imperial: height.imperial,
        metric: height.metric,
      ),
    );
  }
}