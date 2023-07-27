import 'package:dartz/dartz.dart';
import 'package:grapcoin/src/core/helpers/errors.dart';
import 'package:grapcoin/src/core/helpers/value_failure.dart';

abstract class ValueObjects<T> {
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();
  bool isEmpty() => value.fold(
        (l) => l.maybeMap(
          orElse: () => false,
          empty: (_) => true,
        ),
        (r) => false,
      );

  T getOrCrash() => value.fold((l) => throw UnexpectedValueError(l), (r) => r);
  String getOrEmpty() => value.fold((l) => '', (r) => r.toString());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObjects<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value(value: $value)';
}
