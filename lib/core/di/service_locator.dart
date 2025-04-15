 import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/dog_repository.dart';
import '../../data/repositories/dog_repository_impl.dart';
import '../../domain/usecases/get_dogs.dart';
import '../../presentation/bloc/dog_cubit.dart';
import '../network/dio_setup.dart';

final getIt = GetIt.instance;

void setupLocator() {
  const token = 'live_Q0ckFnGclr2O13CcOZ0r4KVtebRj9DVZKciNUH3eQANlbK1bOhcJU8au7ZVjVZt5';

  // Регистрация Dio
  getIt.registerSingleton<Dio>(setupDio(token));

  // Регистрация RemoteDataSource
  getIt.registerSingleton<RemoteDataSource>(
    RemoteDataSourceImpl(dio: getIt<Dio>()),
  );

  // Регистрация DogRepository
  getIt.registerSingleton<DogRepository>(
    DogRepositoryImpl(remoteDataSource: getIt<RemoteDataSource>()),
  );

  // Регистрация GetDogsUseCase
  getIt.registerFactory<GetDogsUseCase>(
        () => GetDogsUseCase(dogRepository: getIt<DogRepository>()),
  );

  // Регистрация DogCubit
  getIt.registerFactory<DogCubit>(
        () => DogCubit(getDogsUseCase: getIt<GetDogsUseCase>()),
  );
}

