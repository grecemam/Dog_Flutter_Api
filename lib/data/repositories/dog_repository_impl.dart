// data/repositories/dog_repository_impl.dart
import '../../domain/entities/dog_entity.dart';
import '../datasources/remote_data_source.dart';
import 'dog_repository.dart';

class DogRepositoryImpl implements DogRepository {
  final RemoteDataSource remoteDataSource;

  DogRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DogEntity>> getDogsData() async {
    final dogs = await remoteDataSource.getDogsData();
    return dogs.map((dog) => dog.toEntity()).toList();
  }
}