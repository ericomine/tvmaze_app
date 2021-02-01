import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/cubit_page.dart';

import '../home_cubit.dart';
import '../home_state.dart';

class HomeModalSheet extends CubitPage<HomeCubit> {
  final void Function() onTapFav;
  final void Function() onTapResetFpSettings;

  HomeModalSheet({
    this.onTapFav,
    this.onTapResetFpSettings,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text("My favorite shows"),
                trailing: const Icon(Icons.chevron_right),
                onTap: onTapFav,
              ),
              ListTile(
                leading: const Icon(Icons.fingerprint),
                title: const Text("Reset my fingerprint settings"),
                trailing: const Icon(Icons.chevron_right),
                onTap: onTapResetFpSettings,
              ),
            ],
          ),
        );
      },
    );
  }
}
