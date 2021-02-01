import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tvmaze_app/domain/entities/episode.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'tv_show_details_state.freezed.dart';

@freezed
abstract class TvShowDetailsState with _$TvShowDetailsState {
  const factory TvShowDetailsState({
    @required ScrollController scrollController,
    @required @nullable TVShow tvShow,
    @required bool isFavorite,
    @required @nullable Map<int, List<Episode>> episodesPerSeason,
    @required bool isLoadingShow,
    @required bool isLoadingEpisodes,
    @required @nullable String errorMessage,
  }) = _TvShowDetailsState;

  factory TvShowDetailsState.initial() => TvShowDetailsState(
        scrollController: ScrollController(),
        tvShow: null,
        isFavorite: false,
        episodesPerSeason: {},
        isLoadingShow: false,
        isLoadingEpisodes: false,
        errorMessage: null,
      );
}
