import 'package:injectable/injectable.dart';
import 'package:tvmaze_app/app/common/result.dart';
import 'package:tvmaze_app/data/repositories/settings_data_source.dart';

abstract class SettingsRepository {
  Result<bool> getHasBiometrics();
  Result<bool> getUseAuth();
  Future<Result<void>> setHasBiometrics(bool value);
  Future<Result<void>> setUseAuth(bool value);
}

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepositoryImpl(this.dataSource);

  @override
  Result<bool> getHasBiometrics() {
    try {
      final hasBiometrics = dataSource.getHasBiometrics();
      return Result.success(value: hasBiometrics);
    } catch (error) {
      return const Result.error("Error occurred getting cached device info");
    }
  }

  @override
  Result<bool> getUseAuth() {
    try {
      final useAuth = dataSource.getUseAuth();
      return Result.success(value: useAuth);
    } catch (error) {
      return const Result.error("Error occurred getting fingerprint settings");
    }
  }

  @override
  Future<Result<void>> setHasBiometrics(bool value) async {
    try {
      await dataSource.setHasBiometrics(value);
      return const Result.success();
    } catch (error) {
      return const Result.error("Error occurred saving device info.");
    }
  }

  @override
  Future<Result<void>> setUseAuth(bool value) async {
    try {
      await dataSource.setUseAuth(value);
      return const Result.success();
    } catch (error) {
      return const Result.error("Error occurred saving fingerprint settings.");
    }
  }
}
