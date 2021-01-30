import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/app/common/string_x.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final TVMazeApi api; // TODO: Use repository/datasources

  HomeCubit(this.api) : super(HomeState.initial());

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    final showList = await api.getShowList(page: 0);
    emit(state.copyWith(
      isLoading: false,
      pageIndex: state.pageIndex + 1,
      showList: showList,
    ));
  }

  Future<void> updateList(String searchQuery) async {
    final previousQuery = state.searchQuery;
    final queryChanged = previousQuery != searchQuery;
    if (queryChanged) {
      emit(state.copyWith(pageIndex: 0));
    }

    emit(state.copyWith(isLoading: true, searchQuery: searchQuery));
    List<TVShow> showList;
    if (searchQuery.isEmpty) {
      showList = await api.getShowList(page: state.pageIndex);
    } else {
      final searchResult = await api.searchShows(query: state.searchQuery);
      showList = searchResult.map((result) => result?.tvShow).toList();
    }

    // if (result is Error) {}

    emit(state.copyWith(
        isLoading: false, pageIndex: state.pageIndex + 1, showList: showList));
  }
}
