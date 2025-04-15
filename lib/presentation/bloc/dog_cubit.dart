import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_dogs.dart';
import 'dog_state.dart';

class DogCubit extends Cubit<DogState> {
  final GetDogsUseCase getDogsUseCase;

  DogCubit({required this.getDogsUseCase}) : super(DogLoading()) {
    fetchDogs();
  }

  Future<void> fetchDogs() async {
    emit(DogLoading());
    try {
      final dogs = await getDogsUseCase();
      emit(DogLoaded(dogs));
    } catch (e) {
      emit(DogError("Не удалось загрузить данные: $e"));
    }
  }




}
