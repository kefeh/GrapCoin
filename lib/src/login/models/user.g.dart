// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      uid: json['uid'] as String,
      name: json['name'] as String,
      userNameSensitiveCase: json['userNameSensitiveCase'] as String?,
      registeredAt: fromJsonDateTimeNullable(json['registeredAt'] as int?),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'nameToDisplay': instance.nameToDisplay,
      'uid': instance.uid,
      'name': instance.name,
      'userNameSensitiveCase': instance.userNameSensitiveCase,
      'registeredAt': toJsonDateTimeNullable(instance.registeredAt),
      'email': instance.email,
    };
