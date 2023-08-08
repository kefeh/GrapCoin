import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/constants/constants.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));
  if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));

  if (RegExp(emailRegexPattern).hasMatch(input)) return right(input);

  return left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));
  RegExp regExp = RegExp(passwordRegexPattern);

  if (input.length >= 8 && regExp.hasMatch(input)) return right(input);
  return left(ValueFailure.weakPassword(failedValue: input));
}

Either<ValueFailure<String>, String> validateName(String input) {
  if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));
  final doesntStartWithHyperphyn = RegExp(
    r'^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$',
    caseSensitive: false,
  ).hasMatch(input);

  if (doesntStartWithHyperphyn) {
    return right(input);
  }

  return left(ValueFailure.invalidOrLongName(failedValue: input));
}
