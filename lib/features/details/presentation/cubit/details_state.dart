part of 'details_cubit.dart';

sealed class DetailsState {
  const DetailsState();
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final Breed breed;

  DetailsSuccess(this.breed);
}

class DetailsFailure extends DetailsState {
  final ApiErrorModel error;

  DetailsFailure(this.error);
}
