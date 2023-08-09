// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      key: json['key'] as String? ?? '',
      content: json['content'] as String,
      contentUrl: json['content_url'] as String? ?? '',
      from: json['from'] as String,
      at: fromJsonDateTime(json['at'] as int),
      pinnedAt: fromJsonDateTimeNullable(json['pinned_at'] as int?),
      pinned: json['pinned'] as bool,
      type: $enumDecodeNullable(_$MessageEnumEnumMap, json['type']) ??
          MessageEnum.text,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'key': instance.key,
      'content': instance.content,
      'content_url': instance.contentUrl,
      'from': instance.from,
      'at': toJsonDateTime(instance.at),
      'pinned_at': toJsonDateTimeNullable(instance.pinnedAt),
      'pinned': instance.pinned,
      'type': _$MessageEnumEnumMap[instance.type]!,
    };

const _$MessageEnumEnumMap = {
  MessageEnum.text: 'text',
  MessageEnum.image: 'image',
  MessageEnum.video: 'video',
};
