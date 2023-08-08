import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';
import 'package:grapcoin/src/core/models/value_object.dart';
import 'package:grapcoin/src/login/helpers/auth_value_validators.dart';

class Name extends ValueObjects<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  Name._(this.value);

  factory Name(String input) => Name._(validateName(input));
}
