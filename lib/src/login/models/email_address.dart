import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';
import 'package:grapcoin/src/core/models/value_object.dart';
import 'package:grapcoin/src/login/helpers/auth_value_validators.dart';

class EmailAddress extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  EmailAddress._(this.value);

  factory EmailAddress(String value) =>
      EmailAddress._(validateEmailAddress(value));
}
