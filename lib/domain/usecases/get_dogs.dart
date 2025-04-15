import '../../data/repositories/dog_repository.dart';
import '../entities/dog_entity.dart';

class GetDogsUseCase {
  final DogRepository dogRepository;

  GetDogsUseCase({required this.dogRepository});

  Future<List<DogEntity>> call() async {
    return await dogRepository.getDogsData();
  }
}
