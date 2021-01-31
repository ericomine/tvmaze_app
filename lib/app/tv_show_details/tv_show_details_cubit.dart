import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';

import 'tv_show_details_state.dart';

@injectable
class TvShowDetailsCubit extends Cubit<TvShowDetailsState> {
  final TVMazeApi api;

  TvShowDetailsCubit(this.api) : super(TvShowDetailsState.initial());

  Future<void> init(int showId) async {
    emit(state.copyWith(isLoading: true));

    final tvShowWithEpisodes = await api.getShow(id: showId);

    emit(state.copyWith(isLoading: false, tvShow: tvShowWithEpisodes));
  }
}
