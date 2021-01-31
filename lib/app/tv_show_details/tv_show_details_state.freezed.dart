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
      {@required @nullable TVShow tvShow,
      @required bool isLoading,
      @required @nullable String errorMessage}) {
    return _TvShowDetailsState(
      tvShow: tvShow,
      isLoading: isLoading,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TvShowDetailsState = _$TvShowDetailsStateTearOff();

/// @nodoc
mixin _$TvShowDetailsState {
  @nullable
  TVShow get tvShow;
  bool get isLoading;
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
      {@nullable TVShow tvShow, bool isLoading, @nullable String errorMessage});
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
    Object tvShow = freezed,
    Object isLoading = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      tvShow: tvShow == freezed ? _value.tvShow : tvShow as TVShow,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
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
      {@nullable TVShow tvShow, bool isLoading, @nullable String errorMessage});
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
    Object tvShow = freezed,
    Object isLoading = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_TvShowDetailsState(
      tvShow: tvShow == freezed ? _value.tvShow : tvShow as TVShow,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_TvShowDetailsState implements _TvShowDetailsState {
  const _$_TvShowDetailsState(
      {@required @nullable this.tvShow,
      @required this.isLoading,
      @required @nullable this.errorMessage})
      : assert(isLoading != null);

  @override
  @nullable
  final TVShow tvShow;
  @override
  final bool isLoading;
  @override
  @nullable
  final String errorMessage;

  @override
  String toString() {
    return 'TvShowDetailsState(tvShow: $tvShow, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TvShowDetailsState &&
            (identical(other.tvShow, tvShow) ||
                const DeepCollectionEquality().equals(other.tvShow, tvShow)) &&
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
      const DeepCollectionEquality().hash(tvShow) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$TvShowDetailsStateCopyWith<_TvShowDetailsState> get copyWith =>
      __$TvShowDetailsStateCopyWithImpl<_TvShowDetailsState>(this, _$identity);
}

abstract class _TvShowDetailsState implements TvShowDetailsState {
  const factory _TvShowDetailsState(
      {@required @nullable TVShow tvShow,
      @required bool isLoading,
      @required @nullable String errorMessage}) = _$_TvShowDetailsState;

  @override
  @nullable
  TVShow get tvShow;
  @override
  bool get isLoading;
  @override
  @nullable
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$TvShowDetailsStateCopyWith<_TvShowDetailsState> get copyWith;
}
