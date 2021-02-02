import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tvmaze_app/data/repositories/settings_repository.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SettingsRepository settingsRepository;
  final LocalAuthentication auth;

  AuthCubit(this.settingsRepository, this.auth) : super(AuthState.initial());

  void init() {
    final useAuth = settingsRepository.getUseAuth();
    final hasBiometrics = settingsRepository.getHasBiometrics();
    if (useAuth is Error || hasBiometrics is Error) {
      emit(state.copyWith(
          errorMessage:
              "${useAuth.errorMessage}, ${hasBiometrics.errorMessage}"));
    }

    if (useAuth.value == null) {
      emit(state.copyWith(
        needsToSetUseAuth: true,
        needsToSetHasBiometrics: false,
      ));
      return;
    }

    if (useAuth.value) {
      emit(state.copyWith(
        needsToSetUseAuth: false,
        needsToSetHasBiometrics: hasBiometrics.value == null,
        needsToAuthenticate: true,
      ));
      return;
    }

    emit(state.copyWith(
        needsToSetUseAuth: false,
        needsToSetHasBiometrics: false,
        needsToAuthenticate: false,
        shouldNavigateToHome: true));
  }

  Future<void> setUseAuth(bool useAuth) async {
    final result = await settingsRepository.setUseAuth(useAuth);
    if (result is Error) {
      emit(state.copyWith(errorMessage: result.errorMessage));
      return;
    }

    emit(state.copyWith(
      usesAuth: useAuth,
      needsToSetUseAuth: false,
      needsToAuthenticate: !state.shouldNavigateToHome && useAuth,
      shouldNavigateToHome: useAuth ? state.shouldNavigateToHome : true,
    ));
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      emit(state.copyWith(isAuthenticating: true));
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          stickyAuth: true);
      emit(state.copyWith(isAuthenticating: false));
    } on PlatformException catch (e) {
      final result = await settingsRepository.setHasBiometrics(false);
      if (result is Error) {
        emit(state.copyWith(errorMessage: result.errorMessage));
        return;
      }
      emit(state.copyWith(
        needsToSetHasBiometrics: false,
        hasBiometrics: false,
      ));
      debugPrint(e.message);
    }

    emit(state.copyWith(shouldNavigateToHome: authenticated));
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }

  Future<void> willNotAuthenticate() async {
    emit(AuthState.initial());
  }

  Future<void> handleNoBiometrics() async {
    final result = await settingsRepository.setUseAuth(false);
    if (result is Error) {
      emit(state.copyWith(errorMessage: result.errorMessage));
    }

    emit(state.copyWith(
      usesAuth: false,
      needsToAuthenticate: false,
      shouldNavigateToHome: true,
    ));
  }
}
