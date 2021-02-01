import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsDataSource {
  static const _useAuthKey = 'useAuth';
  static const _hasBiometrics = 'hasBiometrics';

  final SharedPreferences sharedPreferences;

  SettingsDataSource(this.sharedPreferences);

  Future<bool> getUseAuth() async {
    return sharedPreferences.getBool(_useAuthKey);
  }

  Future<void> setUseAuth(bool value) async {
    return sharedPreferences.setBool(_useAuthKey, value);
  }

  Future<bool> getHasBiometrics() async {
    return sharedPreferences.getBool(_hasBiometrics);
  }

  Future<void> setHasBiometrics(bool value) async {
    return sharedPreferences.setBool(_hasBiometrics, value);
  }
}
