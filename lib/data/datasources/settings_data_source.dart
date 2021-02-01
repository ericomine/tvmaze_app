import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsDataSource {
  static const _useAuthKey = 'useAuth';

  final SharedPreferences sharedPreferences;

  SettingsDataSource(this.sharedPreferences);

  Future<bool> getUseAuth() async {
    return sharedPreferences.getBool(_useAuthKey);
  }

  Future<void> setUseAuth(bool value) async {
    return sharedPreferences.setBool(_useAuthKey, value);
  }
}
