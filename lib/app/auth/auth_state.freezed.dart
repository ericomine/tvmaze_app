// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _AuthState call(
      {@required @nullable bool usesAuth,
      @required bool needsToSetUseAuth,
      @required bool hasBiometrics,
      @required bool needsToSetHasBiometrics,
      @required bool needsToAuthenticate,
      @required bool isAuthenticating,
      @required bool shouldNavigateToHome,
      @required @nullable String errorMessage}) {
    return _AuthState(
      usesAuth: usesAuth,
      needsToSetUseAuth: needsToSetUseAuth,
      hasBiometrics: hasBiometrics,
      needsToSetHasBiometrics: needsToSetHasBiometrics,
      needsToAuthenticate: needsToAuthenticate,
      isAuthenticating: isAuthenticating,
      shouldNavigateToHome: shouldNavigateToHome,
      errorMessage: errorMessage,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @nullable
  bool get usesAuth;
  bool get needsToSetUseAuth;
  bool get hasBiometrics;
  bool get needsToSetHasBiometrics;
  bool get needsToAuthenticate;
  bool get isAuthenticating;
  bool get shouldNavigateToHome;
  @nullable
  String get errorMessage;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {@nullable bool usesAuth,
      bool needsToSetUseAuth,
      bool hasBiometrics,
      bool needsToSetHasBiometrics,
      bool needsToAuthenticate,
      bool isAuthenticating,
      bool shouldNavigateToHome,
      @nullable String errorMessage});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object usesAuth = freezed,
    Object needsToSetUseAuth = freezed,
    Object hasBiometrics = freezed,
    Object needsToSetHasBiometrics = freezed,
    Object needsToAuthenticate = freezed,
    Object isAuthenticating = freezed,
    Object shouldNavigateToHome = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      usesAuth: usesAuth == freezed ? _value.usesAuth : usesAuth as bool,
      needsToSetUseAuth: needsToSetUseAuth == freezed
          ? _value.needsToSetUseAuth
          : needsToSetUseAuth as bool,
      hasBiometrics: hasBiometrics == freezed
          ? _value.hasBiometrics
          : hasBiometrics as bool,
      needsToSetHasBiometrics: needsToSetHasBiometrics == freezed
          ? _value.needsToSetHasBiometrics
          : needsToSetHasBiometrics as bool,
      needsToAuthenticate: needsToAuthenticate == freezed
          ? _value.needsToAuthenticate
          : needsToAuthenticate as bool,
      isAuthenticating: isAuthenticating == freezed
          ? _value.isAuthenticating
          : isAuthenticating as bool,
      shouldNavigateToHome: shouldNavigateToHome == freezed
          ? _value.shouldNavigateToHome
          : shouldNavigateToHome as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable bool usesAuth,
      bool needsToSetUseAuth,
      bool hasBiometrics,
      bool needsToSetHasBiometrics,
      bool needsToAuthenticate,
      bool isAuthenticating,
      bool shouldNavigateToHome,
      @nullable String errorMessage});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object usesAuth = freezed,
    Object needsToSetUseAuth = freezed,
    Object hasBiometrics = freezed,
    Object needsToSetHasBiometrics = freezed,
    Object needsToAuthenticate = freezed,
    Object isAuthenticating = freezed,
    Object shouldNavigateToHome = freezed,
    Object errorMessage = freezed,
  }) {
    return _then(_AuthState(
      usesAuth: usesAuth == freezed ? _value.usesAuth : usesAuth as bool,
      needsToSetUseAuth: needsToSetUseAuth == freezed
          ? _value.needsToSetUseAuth
          : needsToSetUseAuth as bool,
      hasBiometrics: hasBiometrics == freezed
          ? _value.hasBiometrics
          : hasBiometrics as bool,
      needsToSetHasBiometrics: needsToSetHasBiometrics == freezed
          ? _value.needsToSetHasBiometrics
          : needsToSetHasBiometrics as bool,
      needsToAuthenticate: needsToAuthenticate == freezed
          ? _value.needsToAuthenticate
          : needsToAuthenticate as bool,
      isAuthenticating: isAuthenticating == freezed
          ? _value.isAuthenticating
          : isAuthenticating as bool,
      shouldNavigateToHome: shouldNavigateToHome == freezed
          ? _value.shouldNavigateToHome
          : shouldNavigateToHome as bool,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage as String,
    ));
  }
}

/// @nodoc
class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {@required @nullable this.usesAuth,
      @required this.needsToSetUseAuth,
      @required this.hasBiometrics,
      @required this.needsToSetHasBiometrics,
      @required this.needsToAuthenticate,
      @required this.isAuthenticating,
      @required this.shouldNavigateToHome,
      @required @nullable this.errorMessage})
      : assert(needsToSetUseAuth != null),
        assert(hasBiometrics != null),
        assert(needsToSetHasBiometrics != null),
        assert(needsToAuthenticate != null),
        assert(isAuthenticating != null),
        assert(shouldNavigateToHome != null);

  @override
  @nullable
  final bool usesAuth;
  @override
  final bool needsToSetUseAuth;
  @override
  final bool hasBiometrics;
  @override
  final bool needsToSetHasBiometrics;
  @override
  final bool needsToAuthenticate;
  @override
  final bool isAuthenticating;
  @override
  final bool shouldNavigateToHome;
  @override
  @nullable
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState(usesAuth: $usesAuth, needsToSetUseAuth: $needsToSetUseAuth, hasBiometrics: $hasBiometrics, needsToSetHasBiometrics: $needsToSetHasBiometrics, needsToAuthenticate: $needsToAuthenticate, isAuthenticating: $isAuthenticating, shouldNavigateToHome: $shouldNavigateToHome, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.usesAuth, usesAuth) ||
                const DeepCollectionEquality()
                    .equals(other.usesAuth, usesAuth)) &&
            (identical(other.needsToSetUseAuth, needsToSetUseAuth) ||
                const DeepCollectionEquality()
                    .equals(other.needsToSetUseAuth, needsToSetUseAuth)) &&
            (identical(other.hasBiometrics, hasBiometrics) ||
                const DeepCollectionEquality()
                    .equals(other.hasBiometrics, hasBiometrics)) &&
            (identical(
                    other.needsToSetHasBiometrics, needsToSetHasBiometrics) ||
                const DeepCollectionEquality().equals(
                    other.needsToSetHasBiometrics, needsToSetHasBiometrics)) &&
            (identical(other.needsToAuthenticate, needsToAuthenticate) ||
                const DeepCollectionEquality()
                    .equals(other.needsToAuthenticate, needsToAuthenticate)) &&
            (identical(other.isAuthenticating, isAuthenticating) ||
                const DeepCollectionEquality()
                    .equals(other.isAuthenticating, isAuthenticating)) &&
            (identical(other.shouldNavigateToHome, shouldNavigateToHome) ||
                const DeepCollectionEquality().equals(
                    other.shouldNavigateToHome, shouldNavigateToHome)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(usesAuth) ^
      const DeepCollectionEquality().hash(needsToSetUseAuth) ^
      const DeepCollectionEquality().hash(hasBiometrics) ^
      const DeepCollectionEquality().hash(needsToSetHasBiometrics) ^
      const DeepCollectionEquality().hash(needsToAuthenticate) ^
      const DeepCollectionEquality().hash(isAuthenticating) ^
      const DeepCollectionEquality().hash(shouldNavigateToHome) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {@required @nullable bool usesAuth,
      @required bool needsToSetUseAuth,
      @required bool hasBiometrics,
      @required bool needsToSetHasBiometrics,
      @required bool needsToAuthenticate,
      @required bool isAuthenticating,
      @required bool shouldNavigateToHome,
      @required @nullable String errorMessage}) = _$_AuthState;

  @override
  @nullable
  bool get usesAuth;
  @override
  bool get needsToSetUseAuth;
  @override
  bool get hasBiometrics;
  @override
  bool get needsToSetHasBiometrics;
  @override
  bool get needsToAuthenticate;
  @override
  bool get isAuthenticating;
  @override
  bool get shouldNavigateToHome;
  @override
  @nullable
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
