// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FavoritesStateTearOff {
  const _$FavoritesStateTearOff();

// ignore: unused_element
  _FavoritesState call(
      {@required List<TvShow> favorites,
      @required bool isLoading,
      @required @nullable String errorMessage}) {
    return _FavoritesState(
      favorites: favorites,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FavoritesState = _$FavoritesStateTearOff();

/// @nodoc
mixin _$FavoritesState {
  List<TvShow> get favorites;
  bool get isLoading;
  @nullable
  String get errorMessage;

  @JsonKey(ignore: true)
  $FavoritesStateCopyWith<FavoritesState> get copyWith;
}

/// @nodoc
abstract class $FavoritesStateCopyWith<$Res> {
  factory $FavoritesStateCopyWith(
          FavoritesState value, $Res Function(FavoritesState) then) =
      _$FavoritesStateCopyWithImpl<$Res>;
  $Res call(
      {List<TvShow> favorites, bool isLoading, @nullable String errorMessage});
}

/// @nodoc
class _$FavoritesStateCopyWithImpl<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  _$FavoritesStateCopyWithImpl(this._value, this._then);

  final FavoritesState _value;
  // ignore: unused_field
  final $Res Function(FavoritesState) _then;

  @override
  $Res call({
    Object favorites = freezed,
    Object isLoading = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      favorites:
          favorites == freezed ? _value.favorites : favorites as List<TvShow>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
abstract class _$FavoritesStateCopyWith<$Res>
    implements $FavoritesStateCopyWith<$Res> {
  factory _$FavoritesStateCopyWith(
          _FavoritesState value, $Res Function(_FavoritesState) then) =
      __$FavoritesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<TvShow> favorites, bool isLoading, @nullable String errorMessage});
}

/// @nodoc
class __$FavoritesStateCopyWithImpl<$Res>
    extends _$FavoritesStateCopyWithImpl<$Res>
    implements _$FavoritesStateCopyWith<$Res> {
  __$FavoritesStateCopyWithImpl(
      _FavoritesState _value, $Res Function(_FavoritesState) _then)
      : super(_value, (v) => _then(v as _FavoritesState));

  @override
  _FavoritesState get _value => super._value as _FavoritesState;

  @override
  $Res call({
    Object favorites = freezed,
    Object isLoading = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_FavoritesState(
      favorites:
          favorites == freezed ? _value.favorites : favorites as List<TvShow>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_FavoritesState implements _FavoritesState {
  const _$_FavoritesState(
      {@required this.favorites,
      @required this.isLoading,
      @required @nullable this.errorMessage})
      : assert(favorites != null),
        assert(isLoading != null);

  @override
  final List<TvShow> favorites;
  @override
  final bool isLoading;
  @override
  @nullable
  final String errorMessage;

  @override
  String toString() {
    return 'FavoritesState(favorites: $favorites, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FavoritesState &&
            (identical(other.favorites, favorites) ||
                const DeepCollectionEquality()
                    .equals(other.favorites, favorites)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(favorites) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith =>
      __$FavoritesStateCopyWithImpl<_FavoritesState>(this, _$identity);
}

abstract class _FavoritesState implements FavoritesState {
  const factory _FavoritesState(
      {@required List<TvShow> favorites,
      @required bool isLoading,
      @required @nullable String errorMessage}) = _$_FavoritesState;

  @override
  List<TvShow> get favorites;
  @override
  bool get isLoading;
  @override
  @nullable
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$FavoritesStateCopyWith<_FavoritesState> get copyWith;
}
