import 'package:dio/dio.dart';
import '../models/dog_model.dart';

abstract class RemoteDataSource {
  Future<List<Dog>> getDogsData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<Dog>> getDogsData() async {
    final response = await dio.get('https://api.thedogapi.com/v1/breeds?limit=264&page=0');
    return (response.data as List).map((json) => Dog.fromJson(json)).toList();
  }
}