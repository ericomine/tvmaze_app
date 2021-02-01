import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvmaze_app/app/common/cubit_page.dart';
import 'package:tvmaze_app/app/router.gr.dart';
import 'package:tvmaze_app/app/widgets/tv_static_warning.dart';

import 'auth_cubit.dart';
import 'auth_state.dart';
import 'widgets/please_authenticate.dart';
import 'widgets/please_set_auth.dart';

class AuthPage extends CubitPage<AuthCubit> {
  @override
  void onInit(BuildContext context, AuthCubit cubit) {
    super.onInit(context, cubit);
    cubit.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.shouldNavigateToHome) {
            ExtendedNavigator.root.replace(Routes.homePage);
          }

          if (state.needsToSetUseAuth) {
            return PleaseSetAuth(
                setUseAuth: context.read<AuthCubit>().setUseAuth);
          }

          if (state.needsToAuthenticate) {
            return PleaseAuthenticate(
              onAuthenticate: context.read<AuthCubit>().authenticate,
              onHandleNoBiometrics:
                  context.read<AuthCubit>().handleNoBiometrics,
              hasBiometrics: state.hasBiometrics,
            );
          }

          if (state.errorMessage != null) {
            return TvStaticWarning(message: state.errorMessage);
          }

          return Container();
        },
      ),
    ));
  }
}
