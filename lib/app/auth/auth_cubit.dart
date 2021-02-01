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
    if (useAuth == null) {
      emit(state.copyWith(needsToSetUseAuth: true));
      return;
    }

    if (useAuth) {
      emit(state.copyWith(needsToSetUseAuth: false, needsToAuthenticate: true));
      return;
    }

    emit(state.copyWith(
        needsToSetUseAuth: false,
        needsToAuthenticate: false,
        authenticated: true));
  }

  Future<void> setUseAuth(bool useAuth) async {
    await settingsDataSource.setUseAuth(useAuth);
    emit(state.copyWith(
      usesAuth: useAuth,
      needsToSetUseAuth: false,
      needsToAuthenticate: !state.authenticated && useAuth,
      authenticated: useAuth ? state.authenticated : true,
    ));
    print(state.authenticated);
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
      print(e);
    }
    //if (!mounted) return;

    emit(state.copyWith(authenticated: authenticated));
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }
}
