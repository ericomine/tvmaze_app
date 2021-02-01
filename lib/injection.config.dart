// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/injection/api_module.dart';
import 'app/favorites/favorites_cubit.dart';
import 'data/datasources/favorites_data_source.dart';
import 'app/home/home_cubit.dart';
import 'data/injection/logger_module.dart';
import 'data/injection/shared_prefs_module.dart';
import 'data/api/tvmaze_api.dart';
import 'app/tv_show_details/tv_show_details_cubit.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final loggerModule = _$LoggerModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<Dio>(() => apiModule.dio);
  gh.lazySingleton<Logger>(() => loggerModule.logger);
  final resolvedSharedPreferences =
      await sharedPreferencesModule.sharedPreferences;
  gh.lazySingleton<SharedPreferences>(() => resolvedSharedPreferences);
  gh.lazySingleton<TVMazeApi>(() => apiModule.tvMazeApi);
  gh.factory<FavoritesDataSource>(
      () => FavoritesDataSource(get<SharedPreferences>()));
  gh.factory<HomeCubit>(() => HomeCubit(get<TVMazeApi>()));
  gh.factory<TvShowDetailsCubit>(
      () => TvShowDetailsCubit(get<TVMazeApi>(), get<FavoritesDataSource>()));
  gh.factory<FavoritesCubit>(
      () => FavoritesCubit(get<TVMazeApi>(), get<FavoritesDataSource>()));
  return get;
}

class _$ApiModule extends ApiModule {}

class _$LoggerModule extends LoggerModule {}

class _$SharedPreferencesModule extends SharedPreferencesModule {}
