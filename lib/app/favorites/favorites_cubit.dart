import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/data/datasources/favorites_data_source.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

import 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final TVMazeApi api;
  final FavoritesDataSource favoritesDataSource;

  FavoritesCubit(this.api, this.favoritesDataSource)
      : super(FavoritesState.initial());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));

    final saved = favoritesDataSource.getFavorites();
    final result = <TVShow>[];
    for (final id in saved) {
      final tvShow = await api.getShow(id: id);
      result.add(tvShow);
    }

    emit(state.copyWith(isLoading: false, favorites: result));
  }

  Future<void> checkUpdates() async {
    final savedIds = favoritesDataSource.getFavorites().toSet();
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

  void removeFavorite(int id) {
    favoritesDataSource.removeFavorite(id);
    checkUpdates();
  }
}
