import '../../domain/entities/dog_entity.dart';

abstract class DogRepository {
  Future<List<DogEntity>> getDogsData();
}