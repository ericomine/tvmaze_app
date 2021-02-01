// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/injection/api_module.dart';
import 'app/auth/auth_cubit.dart';
import 'app/favorites/favorites_cubit.dart';
import 'data/repositories/favorites_data_source.dart';
import 'data/repositories/favorites_repository.dart';
import 'app/home/home_cubit.dart';
import 'data/injection/local_auth_module.dart';
import 'data/injection/logger_module.dart';
import 'data/repositories/settings_data_source.dart';
import 'data/repositories/settings_repository.dart';
import 'data/injection/shared_prefs_module.dart';
import 'data/api/tvmaze_api.dart';
import 'app/tv_show_details/tv_show_details_cubit.dart';
import 'data/repositories/tv_shows_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final localAuthModule = _$LocalAuthModule();
  final loggerModule = _$LoggerModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.lazySingleton<Dio>(() => apiModule.dio);
  gh.lazySingleton<LocalAuthentication>(() => localAuthModule.localAuth);
  gh.lazySingleton<Logger>(() => loggerModule.logger);
  final resolvedSharedPreferences =
      await sharedPreferencesModule.sharedPreferences;
  gh.lazySingleton<SharedPreferences>(() => resolvedSharedPreferences);
  gh.lazySingleton<TvMazeApi>(() => apiModule.tvMazeApi);
  gh.factory<FavoritesDataSource>(
      () => FavoritesDataSource(get<SharedPreferences>()));
  gh.lazySingleton<FavoritesRepository>(() =>
      FavoritesRepositoryImpl(get<FavoritesDataSource>(), get<TvMazeApi>()));
  gh.factory<SettingsDataSource>(
      () => SettingsDataSource(get<SharedPreferences>()));
  gh.lazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(get<SettingsDataSource>()));
  gh.factory<TvShowDetailsCubit>(() =>
      TvShowDetailsCubit(get<TvShowsRepository>(), get<FavoritesRepository>()));
  gh.factory<AuthCubit>(
      () => AuthCubit(get<SettingsRepository>(), get<LocalAuthentication>()));
  gh.factory<FavoritesCubit>(() => FavoritesCubit(get<FavoritesRepository>()));
  gh.factory<HomeCubit>(
      () => HomeCubit(get<TvShowsRepository>(), get<SettingsRepository>()));
  return get;
}

class _$ApiModule extends ApiModule {}

class _$LocalAuthModule extends LocalAuthModule {}

class _$LoggerModule extends LoggerModule {}

class _$SharedPreferencesModule extends SharedPreferencesModule {}
