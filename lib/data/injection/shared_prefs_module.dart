import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  @LazySingleton()
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
