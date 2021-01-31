import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'tv_show_details_state.freezed.dart';

@freezed
abstract class TvShowDetailsState with _$TvShowDetailsState {
  const factory TvShowDetailsState({
    @required @nullable TVShow tvShow,
    @required bool isLoading,
    @required @nullable String errorMessage,
  }) = _TvShowDetailsState;

  factory TvShowDetailsState.initial() => const TvShowDetailsState(
        tvShow: null,
        isLoading: false,
        errorMessage: null,
      );
}
