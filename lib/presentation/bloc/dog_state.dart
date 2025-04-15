import '../../domain/entities/dog_entity.dart';

abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
  final List<DogEntity> dogs;

  DogLoaded(this.dogs);
}

class DogError extends DogState {
  final String message;

  DogError(this.message);
}

class DogFavoriteUpdated extends DogState {
  final String dogId;
  DogFavoriteUpdated(this.dogId);
}