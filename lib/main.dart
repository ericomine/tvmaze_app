import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app/app.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  runApp(App());
}