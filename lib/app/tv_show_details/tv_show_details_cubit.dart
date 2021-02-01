import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/repositories/favorites_repository.dart';
import 'package:tvmaze_app/data/repositories/tv_shows_repository.dart';

import '../../domain/entities/episode.dart';
import '../../domain/entities/tv_show.dart';
import 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final TvShowsRepository tvShowsRepository;
  final FavoritesRepository favoritesRepository;

  TvShowDetailsCubit(this.tvShowsRepository, this.favoritesRepository)
      : super(TvShowDetailsState.initial());

  Future<void> init({int tvShowId, TvShow tvShow}) async {
    if (tvShow == null) {
      emit(state.copyWith(isLoadingShow: true));

      final fetchedShow = await tvShowsRepository.getShow(tvShowId);
      if (fetchedShow is Error) {
        emit(state.copyWith(errorMessage: fetchedShow.errorMessage));
      }

      final isFavorite =
          favoritesRepository.checkIfIsFavorite(fetchedShow.value);
      if (isFavorite is Error) {
        emit(state.copyWith(errorMessage: isFavorite.errorMessage));
      }

      emit(state.copyWith(
          isLoadingShow: false,
          tvShow: fetchedShow.value,
          isFavorite: isFavorite.value));
      return;
    }

    final isFavorite = favoritesRepository.checkIfIsFavorite(tvShow);
    if (isFavorite is Error) {
      emit(state.copyWith(errorMessage: isFavorite.errorMessage));
    }
    emit(state.copyWith(tvShow: tvShow, isFavorite: isFavorite.value));
  }

  Future<void> loadEpisodes() async {
    emit(state.copyWith(isLoadingEpisodes: true));
    final episodesResult =
        await tvShowsRepository.getEpisodes(state.tvShow?.id);
    if (episodesResult is Error) {
      emit(state.copyWith(errorMessage: episodesResult.errorMessage));
    }

    final episodes = episodesResult.value;
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
    favoritesRepository.addFavorite(state.tvShow);
    emit(state.copyWith(isFavorite: true));
  }

  void removeFavorite() {
    favoritesRepository.removeFavorite(state.tvShow);
    emit(state.copyWith(isFavorite: false));
  }
}
