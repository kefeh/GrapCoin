// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatCommand _$$_ChatCommandFromJson(Map<String, dynamic> json) =>
    _$_ChatCommand(
      name: json['name'] as String,
      description: json['description'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_ChatCommandToJson(_$_ChatCommand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
    };
