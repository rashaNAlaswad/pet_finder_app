part of 'home_cubit.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Breed> breeds;

  HomeSuccess(this.breeds);
}

class HomeFailure extends HomeState {
  final ApiErrorModel error;

  HomeFailure(this.error);
}
