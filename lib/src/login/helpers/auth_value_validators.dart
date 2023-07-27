import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/constants/constants.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));
  if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));

  if (RegExp(EMAIL_REGEX_PATTERN).hasMatch(input)) return right(input);

  return left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.isEmpty) return left(ValueFailure.empty(failedValue: input));
  RegExp regExp = RegExp(PASSWORD_REGEX_PATTERN);

  if (input.length >= 8 && regExp.hasMatch(input)) return right(input);
  return left(ValueFailure.weakPassword(failedValue: input));
}
