import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tvmaze_app/data/datasources/settings_data_source.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SettingsDataSource settingsDataSource;
  final LocalAuthentication auth;

  AuthCubit(this.settingsDataSource, this.auth) : super(AuthState.initial());

  Future<void> init() async {
    final useAuth = await settingsDataSource.getUseAuth();
    final hasBiometrics = await settingsDataSource.getHasBiometrics();

    if (useAuth == null) {
      emit(state.copyWith(
        needsToSetUseAuth: true,
        needsToSetHasBiometrics: false,
      ));
      return;
    }

    if (useAuth) {
      emit(state.copyWith(
        needsToSetUseAuth: false,
        needsToSetHasBiometrics: hasBiometrics == null,
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
    await settingsDataSource.setUseAuth(useAuth);
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
      await settingsDataSource.setHasBiometrics(false);
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

  Future<void> handleNoBiometrics() async {
    await settingsDataSource.setUseAuth(false);
    emit(state.copyWith(
      usesAuth: false,
      needsToAuthenticate: false,
      shouldNavigateToHome: true,
    ));
  }
}
