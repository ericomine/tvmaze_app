import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/repositories/favorites_repository.dart';
import '../../domain/entities/tv_show.dart';

import 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;

  FavoritesCubit(this.favoritesRepository) : super(FavoritesState.initial());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final favorites = await favoritesRepository.getFavoritesSortedByName();
    if (favorites is Error) {
      emit(state.copyWith(
          isLoading: false, errorMessage: favorites.errorMessage));
    }

    emit(state.copyWith(isLoading: false, favorites: favorites.value));
  }

  Future<void> checkUpdates() async {
    final savedIdsResult = favoritesRepository.getFavoritesIds();
    if (savedIdsResult is Error) {
      emit(state.copyWith(errorMessage: savedIdsResult.errorMessage));
      return;
    }

    final savedIds = savedIdsResult.value.toSet();
    final removedIds = savedIds.length < state.favorites.length;

    if (removedIds) {
      final currentIds = state.favorites.map((f) => f.id).toSet();
      final idToRemove = currentIds.difference(savedIds).first;
      if (idToRemove != null) {
        final newFavorites =
            state.favorites.where((f) => f.id != idToRemove).toList();
        emit(state.copyWith(favorites: newFavorites));
        return;
      }
    }
  }

  void removeFavorite(TvShow tvShow) {
    favoritesRepository.removeFavorite(tvShow);
    checkUpdates();
  }
}
