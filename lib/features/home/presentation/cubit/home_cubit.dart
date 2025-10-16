import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:async';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BreedRepository _breedRepository;
  final List<Breed> _allBreeds = [];

  final ScrollController scrollController = ScrollController();

  int _currentPage = ApiConstants.defaultPage;
  bool _hasMore = true;
  bool _isFetching = false;

  Timer? _searchDebounce;

  bool get isFetching => _isFetching;

  HomeCubit(this._breedRepository) : super(HomeInitial()) {
    _setupScrollListener();
  }

  Future<void> loadHomeData({int limit = 10, int page = 0}) async {
    if (page == 0) emit(HomeLoading());

    final result = await _breedRepository.getBreeds(limit: limit, page: page);
    result.when(
      success: (breeds) {
        if (page == 0) {
          _allBreeds.clear();
          _allBreeds.addAll(breeds);
        } else {
          _allBreeds.addAll(breeds);
          _currentPage = page;
        }

        // if we received less items than requested, indicating there is no more data
        // so we need to stop loading more data
        _hasMore = breeds.length == limit;

        emit(HomeSuccess(List<Breed>.from(_allBreeds)));
      },
      failure: (error) => emit(HomeFailure(error)),
    );
  }

  Future<void> loadNextPage({int limit = ApiConstants.defaultLimit}) async {
    if (!_hasMore || _isFetching) return;

    final nextPage = _currentPage + 1;
    _isFetching = true;

    // Emit current state to show loading indicator
    emit(HomeSuccess(List<Breed>.from(_allBreeds)));

    final result = await _breedRepository.getBreeds(
      limit: limit,
      page: nextPage,
    );

    result.when(
      success: (breeds) {
        _allBreeds.addAll(breeds);
        _currentPage = nextPage;
        _hasMore = breeds.length == limit;
        _isFetching = false;
        emit(HomeSuccess(List<Breed>.from(_allBreeds)));
      },
      failure: (error) {
        _isFetching = false;
        // we don't emit failure for pagination errors, we just stop loading
        emit(HomeSuccess(List<Breed>.from(_allBreeds)));
      },
    );
  }

  void search(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      final trimmedQuery = query.trim();

      if (trimmedQuery.isEmpty) {
        emit(HomeSuccess(List<Breed>.from(_allBreeds)));
        return;
      }

      final filteredBreeds = _allBreeds
          .where(
            (breed) =>
                breed.name.toLowerCase().contains(trimmedQuery.toLowerCase()),
          )
          .toList();

      emit(HomeSuccess(filteredBreeds));
    });
  }

  void clearSearch() {
    _searchDebounce?.cancel();
    emit(HomeSuccess(List<Breed>.from(_allBreeds)));
  }

  Future<void> refresh() async {
    resetPagination();
    await loadHomeData();
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        loadNextPage();
      }
    });
  }

  void resetPagination() {
    _currentPage = 0;
    _hasMore = true;
    _allBreeds.clear();
    _isFetching = false;
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    scrollController.dispose();
    return super.close();
  }
}
