import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/datasources/favorites_data_source.dart';
import '../../data/api/tvmaze_api.dart';
import '../../domain/entities/episode.dart';
import '../../domain/entities/tv_show.dart';

import 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final TVMazeApi api;
  final FavoritesDataSource favoritesDataSource;

  TvShowDetailsCubit(this.api, this.favoritesDataSource)
      : super(TvShowDetailsState.initial());

  Future<void> init({int tvShowId, TVShow tvShow}) async {
    final isFavorite = favoritesDataSource.isFavorite(tvShow.id ?? tvShowId);

    if (tvShow == null) {
      emit(state.copyWith(isLoadingShow: true));
      final newShow = await api.getShow(id: tvShowId);
      emit(state.copyWith(
          isLoadingShow: false, tvShow: newShow, isFavorite: isFavorite));
      return;
    }

    emit(state.copyWith(tvShow: tvShow, isFavorite: isFavorite));
  }

  Future<void> loadEpisodes() async {
    emit(state.copyWith(isLoadingEpisodes: true));
    final episodes = await api.getEpisodes(showId: state.tvShow?.id);

    final episodesPerSeason = <int, List<Episode>>{};
    for (final ep in episodes) {
      if (episodesPerSeason.containsKey(ep.season)) {
        episodesPerSeason[ep.season].add(ep);
      } else {
        episodesPerSeason[ep.season] = [ep];
      }
    }

    emit(state.copyWith(
      isLoadingEpisodes: false,
      episodesPerSeason: episodesPerSeason,
    ));
  }

  void toggleFavorite() {
    if (state.isFavorite) {
      removeFavorite();
      return;
    }
    saveFavorite();
  }

  void saveFavorite() {
    favoritesDataSource.addFavorite(state.tvShow.id);
    emit(state.copyWith(isFavorite: true));
  }

  void removeFavorite() {
    favoritesDataSource.removeFavorite(state.tvShow.id);
    emit(state.copyWith(isFavorite: false));
  }
}
