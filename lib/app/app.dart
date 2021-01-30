import 'package:flutter/material.dart';
import 'package:tvmaze_app/app/theme.dart';

import 'home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TVMaze',
      theme: buildTheme(),
      home: HomePage(),
    );
  }
}
