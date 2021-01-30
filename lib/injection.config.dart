// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'data/injection/api_module.dart';
import 'app/injection/logger_module.dart';
import 'data/api/tvmaze_api.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final loggerModule = _$LoggerModule();
  gh.lazySingleton<Dio>(() => apiModule.dio);
  gh.lazySingleton<Logger>(() => loggerModule.logger);
  gh.lazySingleton<TVMazeApi>(() => apiModule.api);
  return get;
}

class _$ApiModule extends ApiModule {}

class _$LoggerModule extends LoggerModule {}
