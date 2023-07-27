import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';
import 'package:grapcoin/src/core/models/value_object.dart';
import 'package:grapcoin/src/login/helpers/auth_value_validators.dart';

class Password extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  Password._(this.value);

  factory Password(String input) => Password._(validatePassword(input));
}
