import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/repositories/settings_repository.dart';
import 'package:tvmaze_app/data/repositories/tv_shows_repository.dart';

import '../../data/api/tvmaze_api.dart';
import '../../data/repositories/settings_data_source.dart';
import '../../domain/entities/tv_show.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final TvShowsRepository tvShowsRepository;
  final SettingsRepository settingsRepository;

  HomeCubit(this.tvShowsRepository, this.settingsRepository)
      : super(HomeState.initial());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final showList = await tvShowsRepository.getShowList(state.pageIndex);

    if (showList is Error) {
      emit(state.copyWith(errorMessage: showList.errorMessage));
    }

    emit(state.copyWith(
      isLoading: false,
      pageIndex: state.pageIndex + 1,
      showList: showList.value,
    ));
  }

  Future<void> onQueryChanged(String searchQuery) async {
    if (searchQuery == state.searchQuery) {
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      pageIndex: 0,
      searchQuery: searchQuery,
      showList: [],
    ));

    final showList = await getShowList();

    emit(state.copyWith(
      isLoading: false,
      pageIndex: state.pageIndex + 1,
      showList: showList,
    ));
  }

  Future<void> onEndOfScroll() async {
    if (state.searchQuery.isNotEmpty) {
      // The search endpoint has no pagination.
      // No behavior is expected when end of scroll reached.
      return;
    }

    emit(state.copyWith(isLoading: true));

    final newShowList = await getShowList();

    emit(state.copyWith(
      isLoading: false,
      pageIndex: state.pageIndex + 1,
      showList: [...state.showList, ...newShowList],
    ));
  }

  Future<List<TvShow>> getShowList() async {
    List<TvShow> showList;
    if (state.searchQuery.isEmpty) {
      final result = await tvShowsRepository.getShowList(state.pageIndex);
      if (result is Error) {
        emit(state.copyWith(errorMessage: result.errorMessage));
        showList = [];
      } else {
        showList = result.value;
      }
    } else {
      final searchResult =
          await tvShowsRepository.searchShows(state.searchQuery);
      if (searchResult is Error) {
        emit(state.copyWith(errorMessage: searchResult.errorMessage));
        showList = [];
      } else {
        showList = searchResult.value.map((result) => result?.tvShow).toList();
      }
    }
    return showList;
  }

  Future<void> resetFingerprintSettings() async {
    final result = await settingsRepository.setUseAuth(null);
    if (result is Error) {
      emit(state.copyWith(errorMessage: result.errorMessage));
    }
  }
}
