import 'package:freezed_annotation/freezed_annotation.dart';
part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const ValueFailure._();
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.weakPassword({required T failedValue}) =
      WeakPassword<T>;
  const factory ValueFailure.shortCode({required T failedValue}) = ShortCode<T>;
  const factory ValueFailure.shortName({required T failedValue}) = ShortName<T>;
  const factory ValueFailure.invalidOrLongName({required T failedValue}) =
      InvalidOrLongName<T>;
  const factory ValueFailure.shortFullName({required T failedValue}) =
      ShortFullName<T>;
  const factory ValueFailure.invalidDate({required T failedValue}) =
      InvalidDate<T>;
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
}
