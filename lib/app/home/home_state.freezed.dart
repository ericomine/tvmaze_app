// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

// ignore: unused_element
  _HomeState call(
      {@required bool isLoading,
      @required List<TVShow> showList,
      @required int pageIndex,
      @required String searchQuery,
      @required @nullable String errorMessage}) {
    return _HomeState(
      isLoading: isLoading,
      showList: showList,
      pageIndex: pageIndex,
      searchQuery: searchQuery,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  bool get isLoading;
  List<TVShow> get showList;
  int get pageIndex;
  String get searchQuery;
  @nullable
  String get errorMessage;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<TVShow> showList,
      int pageIndex,
      String searchQuery,
      @nullable String errorMessage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object isLoading = freezed,
    Object showList = freezed,
    Object pageIndex = freezed,
    Object searchQuery = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      showList:
          showList == freezed ? _value.showList : showList as List<TVShow>,
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
      searchQuery:
          searchQuery == freezed ? _value.searchQuery : searchQuery as String,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<TVShow> showList,
      int pageIndex,
      String searchQuery,
      @nullable String errorMessage});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object isLoading = freezed,
    Object showList = freezed,
    Object pageIndex = freezed,
    Object searchQuery = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_HomeState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      showList:
          showList == freezed ? _value.showList : showList as List<TVShow>,
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
      searchQuery:
          searchQuery == freezed ? _value.searchQuery : searchQuery as String,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {@required this.isLoading,
      @required this.showList,
      @required this.pageIndex,
      @required this.searchQuery,
      @required @nullable this.errorMessage})
      : assert(isLoading != null),
        assert(showList != null),
        assert(pageIndex != null),
        assert(searchQuery != null);

  @override
  final bool isLoading;
  @override
  final List<TVShow> showList;
  @override
  final int pageIndex;
  @override
  final String searchQuery;
  @override
  @nullable
  final String errorMessage;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, showList: $showList, pageIndex: $pageIndex, searchQuery: $searchQuery, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.showList, showList) ||
                const DeepCollectionEquality()
                    .equals(other.showList, showList)) &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.searchQuery, searchQuery) ||
                const DeepCollectionEquality()
                    .equals(other.searchQuery, searchQuery)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(showList) ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(searchQuery) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {@required bool isLoading,
      @required List<TVShow> showList,
      @required int pageIndex,
      @required String searchQuery,
      @required @nullable String errorMessage}) = _$_HomeState;

  @override
  bool get isLoading;
  @override
  List<TVShow> get showList;
  @override
  int get pageIndex;
  @override
  String get searchQuery;
  @override
  @nullable
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith;
}
