import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_failure.freezed.dart';

/// Union of failures for firebase service transactions
@freezed
class FirebaseFailure with _$FirebaseFailure {
  const FirebaseFailure._();

  /// for failed updates
  const factory FirebaseFailure.update(String error) = Update;

  /// for failed add
  const factory FirebaseFailure.add(String error) = Add;

  /// for failed delete
  const factory FirebaseFailure.delete(String error) = Delete;

  /// snapshot stream
  const factory FirebaseFailure.snapshot(String error) = Snapshot;

  /// for failed getting information
  const factory FirebaseFailure.get(String error) = Get;
}
