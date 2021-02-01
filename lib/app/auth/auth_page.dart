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
    return Scaffold(
        body: SingleChildScrollView(
      child: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            previous.authenticated != current.authenticated,
        listener: (context, state) {
          if (state.authenticated) {
            ExtendedNavigator.root.replace(Routes.homePage);
          }
        },
        builder: (context, state) {
          if (state.needsToSetUseAuth) {
            return PleaseSetAuth(
                setUseAuth: context.read<AuthCubit>().setUseAuth);
          }

          if (state.needsToAuthenticate) {
            return PleaseAuthenticate(
                onTap: context.read<AuthCubit>().authenticate);
          }

          return const TvStaticWarning(message: "Oops, something went wrong");
        },
      ),
    ));
  }
}
