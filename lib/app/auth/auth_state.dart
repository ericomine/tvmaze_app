import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @required @nullable bool usesAuth,
    @required bool needsToSetUseAuth,
    @required bool hasBiometrics,
    @required bool needsToSetHasBiometrics,
    @required bool needsToAuthenticate,
    @required bool isAuthenticating,
    @required bool shouldNavigateToHome,
    @required @nullable String errorMessage,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        usesAuth: null,
        needsToSetUseAuth: true,
        hasBiometrics: true,
        needsToSetHasBiometrics: true,
        needsToAuthenticate: true,
        isAuthenticating: false,
        shouldNavigateToHome: false,
        errorMessage: null,
      );
}
