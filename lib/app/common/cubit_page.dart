import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

abstract class CubitPage<T extends Cubit> extends StatefulWidget {
  Widget build(BuildContext context);

  void onInit(BuildContext context, T cubit) {}

  void onDispose(BuildContext context, T cubit) {}

  @override
  _CubitPageState<T> createState() => _CubitPageState<T>();
}

class _CubitPageState<T extends Cubit> extends State<CubitPage<T>> {
  final T _cubit = getIt.get<T>();

  @override
  void initState() {
    widget.onInit(context, _cubit);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose(context, _cubit);
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider<T>(
      create: (context) => _cubit,
      child: Builder(
        builder: (context) => widget.build(context),
      ),
    );
  }
}
