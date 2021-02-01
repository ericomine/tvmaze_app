import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> implements _$Result<T> {
  const factory Result.success({@nullable T value}) = Success<T>;
  const factory Result.error(String message) = Error<T>;
  const Result._();

  T get value => when(success: (value) => value, error: (message) => null);
  String get errorMessage =>
      when(success: (_) => null, error: (message) => message);
}
