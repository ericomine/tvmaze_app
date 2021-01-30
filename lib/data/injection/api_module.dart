import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/data/api/tvmaze_api.dart';

import '../../injection.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  TVMazeApi get api => TVMazeApi(getIt<Dio>());
}
