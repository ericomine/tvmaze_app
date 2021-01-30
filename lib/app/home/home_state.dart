import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @required bool isLoading,
    @required List<TVShow> showList,
    @required int pageIndex,
    @required String searchQuery,
    @required @nullable String errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isLoading: false,
        showList: [],
        pageIndex: 0,
        searchQuery: "",
        errorMessage: null,
      );
}