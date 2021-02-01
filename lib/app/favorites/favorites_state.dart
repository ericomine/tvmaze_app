import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @required List<TvShow> favorites,
    @required bool isLoading,
    @required @nullable String errorMessage,
  }) = _FavoritesState;

  factory FavoritesState.initial() => const FavoritesState(
        favorites: [],
        isLoading: false,
        errorMessage: null,
      );
}
