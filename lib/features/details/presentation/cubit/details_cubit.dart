import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../home/domain/entities/breed.dart';
import '../../domain/repositories/derails_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepository _detailsRepository;
  DetailsCubit(this._detailsRepository) : super(DetailsInitial());

  Future<void> loadBreedDetails(String petId) async {
    emit(DetailsLoading());

    final result = await _detailsRepository.getBreedDetails(petId);
    result.when(
      success: (breed) {
        emit(DetailsSuccess(breed));
      },
      failure: (error) => emit(DetailsFailure(error)),
    );
  }
}
