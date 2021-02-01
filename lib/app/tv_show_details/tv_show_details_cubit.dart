import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/api/tvmaze_api.dart';
import '../../domain/entities/episode.dart';
import '../../domain/entities/tv_show.dart';

import 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final TVMazeApi api;
  final SharedPreferences sharedPreferences;

  TvShowDetailsCubit(this.api, this.sharedPreferences)
      : super(TvShowDetailsState.initial());

  Future<void> init({int tvShowId, TVShow tvShow}) async {
    if (tvShow == null) {
      emit(state.copyWith(isLoadingShow: true));
      final newShow = await api.getShow(id: tvShowId);
      emit(state.copyWith(isLoadingShow: false, tvShow: newShow));
      return;
    }

    emit(state.copyWith(tvShow: tvShow));
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
}
