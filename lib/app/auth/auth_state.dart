import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required @nullable bool usesAuth,
    @required bool needsToSetUseAuth,
    @required bool needsToAuthenticate,
    @required bool isAuthenticating,
    @required bool authenticated,
    @required @nullable String errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        usesAuth: null,
        needsToSetUseAuth: true,
        needsToAuthenticate: true,
        isAuthenticating: false,
        authenticated: false,
        errorMessage: null,
      );
}
