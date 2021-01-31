import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:tvmaze_app/app/router.gr.dart';
import 'package:tvmaze_app/app/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: buildTheme(),
        builder: ExtendedNavigator<Router>(
          router: Router(),
        ));
  }
}
