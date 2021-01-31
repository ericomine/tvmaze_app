import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final TVMazeApi api; // TODO: Use repository/datasources

  HomeCubit(this.api) : super(HomeState.initial());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final showList = await api.getShowList(page: state.pageIndex);
    emit(state.copyWith(
      isLoading: false,
      pageIndex: state.pageIndex + 1,
      showList: showList,
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

  Future<List<TVShow>> getShowList() async {
    List<TVShow> showList;
    if (state.searchQuery.isEmpty) {
      showList = await api.getShowList(page: state.pageIndex);
    } else {
      final searchResult = await api.searchShows(query: state.searchQuery);
      showList = searchResult.map((result) => result?.tvShow).toList();
    }

    // TODO: if (result is Error) {}

    return showList;
  }
}
