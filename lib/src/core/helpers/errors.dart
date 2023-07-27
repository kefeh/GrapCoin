import 'package:grapcoin/src/core/helpers/value_failure.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const String explaination =
        "Encountered a valueFailure at an unrecoverable point. Terminating";

    return Error.safeToString("$explaination Failure was: $valueFailure");
  }
}
