// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'tv_show_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TvShowDetailsStateTearOff {
  const _$TvShowDetailsStateTearOff();

// ignore: unused_element
  _TvShowDetailsState call(
      {@required ScrollController scrollController,
      @required @nullable TVShow tvShow,
      @required bool isFavorite,
      @required @nullable Map<int, List<Episode>> episodesPerSeason,
      @required bool isLoadingShow,
      @required bool isLoadingEpisodes,
      @required @nullable String errorMessage}) {
    return _TvShowDetailsState(
      scrollController: scrollController,
      tvShow: tvShow,
      isFavorite: isFavorite,
      episodesPerSeason: episodesPerSeason,
      isLoadingShow: isLoadingShow,
      isLoadingEpisodes: isLoadingEpisodes,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TvShowDetailsState = _$TvShowDetailsStateTearOff();

/// @nodoc
mixin _$TvShowDetailsState {
  ScrollController get scrollController;
  @nullable
  TVShow get tvShow;
  bool get isFavorite;
  @nullable
  Map<int, List<Episode>> get episodesPerSeason;
  bool get isLoadingShow;
  bool get isLoadingEpisodes;
  @nullable
  String get errorMessage;

  @JsonKey(ignore: true)
  $TvShowDetailsStateCopyWith<TvShowDetailsState> get copyWith;
}

/// @nodoc
abstract class $TvShowDetailsStateCopyWith<$Res> {
  factory $TvShowDetailsStateCopyWith(
          TvShowDetailsState value, $Res Function(TvShowDetailsState) then) =
      _$TvShowDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {ScrollController scrollController,
      @nullable TVShow tvShow,
      bool isFavorite,
      @nullable Map<int, List<Episode>> episodesPerSeason,
      bool isLoadingShow,
      bool isLoadingEpisodes,
      @nullable String errorMessage});
}

/// @nodoc
class _$TvShowDetailsStateCopyWithImpl<$Res>
    implements $TvShowDetailsStateCopyWith<$Res> {
  _$TvShowDetailsStateCopyWithImpl(this._value, this._then);

  final TvShowDetailsState _value;
  // ignore: unused_field
  final $Res Function(TvShowDetailsState) _then;

  @override
  $Res call({
    Object scrollController = freezed,
    Object tvShow = freezed,
    Object isFavorite = freezed,
    Object episodesPerSeason = freezed,
    Object isLoadingShow = freezed,
    Object isLoadingEpisodes = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController as ScrollController,
      tvShow: tvShow == freezed ? _value.tvShow : tvShow as TVShow,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
      episodesPerSeason: episodesPerSeason == freezed
          ? _value.episodesPerSeason
          : episodesPerSeason as Map<int, List<Episode>>,
      isLoadingShow: isLoadingShow == freezed
          ? _value.isLoadingShow
          : isLoadingShow as bool,
      isLoadingEpisodes: isLoadingEpisodes == freezed
          ? _value.isLoadingEpisodes
          : isLoadingEpisodes as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
abstract class _$TvShowDetailsStateCopyWith<$Res>
    implements $TvShowDetailsStateCopyWith<$Res> {
  factory _$TvShowDetailsStateCopyWith(
          _TvShowDetailsState value, $Res Function(_TvShowDetailsState) then) =
      __$TvShowDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ScrollController scrollController,
      @nullable TVShow tvShow,
      bool isFavorite,
      @nullable Map<int, List<Episode>> episodesPerSeason,
      bool isLoadingShow,
      bool isLoadingEpisodes,
      @nullable String errorMessage});
}

/// @nodoc
class __$TvShowDetailsStateCopyWithImpl<$Res>
    extends _$TvShowDetailsStateCopyWithImpl<$Res>
    implements _$TvShowDetailsStateCopyWith<$Res> {
  __$TvShowDetailsStateCopyWithImpl(
      _TvShowDetailsState _value, $Res Function(_TvShowDetailsState) _then)
      : super(_value, (v) => _then(v as _TvShowDetailsState));

  @override
  _TvShowDetailsState get _value => super._value as _TvShowDetailsState;

  @override
  $Res call({
    Object scrollController = freezed,
    Object tvShow = freezed,
    Object isFavorite = freezed,
    Object episodesPerSeason = freezed,
    Object isLoadingShow = freezed,
    Object isLoadingEpisodes = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_TvShowDetailsState(
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController as ScrollController,
      tvShow: tvShow == freezed ? _value.tvShow : tvShow as TVShow,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
      episodesPerSeason: episodesPerSeason == freezed
          ? _value.episodesPerSeason
          : episodesPerSeason as Map<int, List<Episode>>,
      isLoadingShow: isLoadingShow == freezed
          ? _value.isLoadingShow
          : isLoadingShow as bool,
      isLoadingEpisodes: isLoadingEpisodes == freezed
          ? _value.isLoadingEpisodes
          : isLoadingEpisodes as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_TvShowDetailsState implements _TvShowDetailsState {
  const _$_TvShowDetailsState(
      {@required this.scrollController,
      @required @nullable this.tvShow,
      @required this.isFavorite,
      @required @nullable this.episodesPerSeason,
      @required this.isLoadingShow,
      @required this.isLoadingEpisodes,
      @required @nullable this.errorMessage})
      : assert(scrollController != null),
        assert(isFavorite != null),
        assert(isLoadingShow != null),
        assert(isLoadingEpisodes != null);

  @override
  final ScrollController scrollController;
  @override
  @nullable
  final TVShow tvShow;
  @override
  final bool isFavorite;
  @override
  @nullable
  final Map<int, List<Episode>> episodesPerSeason;
  @override
  final bool isLoadingShow;
  @override
  final bool isLoadingEpisodes;
  @override
  @nullable
  final String errorMessage;

  @override
  String toString() {
    return 'TvShowDetailsState(scrollController: $scrollController, tvShow: $tvShow, isFavorite: $isFavorite, episodesPerSeason: $episodesPerSeason, isLoadingShow: $isLoadingShow, isLoadingEpisodes: $isLoadingEpisodes, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TvShowDetailsState &&
            (identical(other.scrollController, scrollController) ||
                const DeepCollectionEquality()
                    .equals(other.scrollController, scrollController)) &&
            (identical(other.tvShow, tvShow) ||
                const DeepCollectionEquality().equals(other.tvShow, tvShow)) &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)) &&
            (identical(other.episodesPerSeason, episodesPerSeason) ||
                const DeepCollectionEquality()
                    .equals(other.episodesPerSeason, episodesPerSeason)) &&
            (identical(other.isLoadingShow, isLoadingShow) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingShow, isLoadingShow)) &&
            (identical(other.isLoadingEpisodes, isLoadingEpisodes) ||
                const DeepCollectionEquality()
                    .equals(other.isLoadingEpisodes, isLoadingEpisodes)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scrollController) ^
      const DeepCollectionEquality().hash(tvShow) ^
      const DeepCollectionEquality().hash(isFavorite) ^
      const DeepCollectionEquality().hash(episodesPerSeason) ^
      const DeepCollectionEquality().hash(isLoadingShow) ^
      const DeepCollectionEquality().hash(isLoadingEpisodes) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$TvShowDetailsStateCopyWith<_TvShowDetailsState> get copyWith =>
      __$TvShowDetailsStateCopyWithImpl<_TvShowDetailsState>(this, _$identity);
}

abstract class _TvShowDetailsState implements TvShowDetailsState {
  const factory _TvShowDetailsState(
      {@required ScrollController scrollController,
      @required @nullable TVShow tvShow,
      @required bool isFavorite,
      @required @nullable Map<int, List<Episode>> episodesPerSeason,
      @required bool isLoadingShow,
      @required bool isLoadingEpisodes,
      @required @nullable String errorMessage}) = _$_TvShowDetailsState;

  @override
  ScrollController get scrollController;
  @override
  @nullable
  TVShow get tvShow;
  @override
  bool get isFavorite;
  @override
  @nullable
  Map<int, List<Episode>> get episodesPerSeason;
  @override
  bool get isLoadingShow;
  @override
  bool get isLoadingEpisodes;
  @override
  @nullable
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$TvShowDetailsStateCopyWith<_TvShowDetailsState> get copyWith;
}
