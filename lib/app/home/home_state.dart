import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tvmaze_app/domain/entities/tv_show.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState implements _$HomeState {
  const factory HomeState({
    @required ScrollController scrollController,
    @required bool isLoading,
    @required List<TVShow> showList,
    @required int pageIndex,
    @required String searchQuery,
    @required @nullable String errorMessage,
  }) = _HomeState;
  const HomeState._();

  factory HomeState.initial() => HomeState(
        scrollController: ScrollController(),
        isLoading: false,
        showList: [],
        pageIndex: 0,
        searchQuery: "",
        errorMessage: null,
      );

  bool get noResultFound => searchQuery.isNotEmpty && showList.isEmpty;
}
