import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grapcoin/src/util/json_converters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();
  factory User({
    required String uid,
    required String name,
    String? userNameSensitiveCase,
    @JsonKey(toJson: toJsonDateTimeNullable, fromJson: fromJsonDateTimeNullable)
    required DateTime? registeredAt,
    String? phoneNumber,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(ignore: true)
  String get nameToDisplay => userNameSensitiveCase ?? name;
}
