import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/cubit_page.dart';

import '../home_cubit.dart';
import '../home_state.dart';

class HomeModalSheet extends CubitPage<HomeCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("My favorite shows"),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                enabled: false,
                leading: Icon(Icons.fiber_pin),
                title: Text("Reset my pin"),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                enabled: false,
                leading: Icon(Icons.fingerprint),
                title: Text("Reset my fingerprint"),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        );
      },
    );
  }
}
