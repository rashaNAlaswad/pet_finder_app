import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedRepository _breedRepository;

  HomeCubit(this._breedRepository) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    final result = await _breedRepository.getBreeds();
    result.when(
      success: (breeds) => emit(HomeSuccess(breeds)),
      failure: (error) => emit(HomeFailure(error)),
    );
  }
}
