// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      key: json['key'] as String,
      name: json['name'] as String,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mutedMembers: (json['muted_members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      profilePic: json['profile_pic'] as String? ?? '',
      createdAt: fromJsonDateTime(json['created_at'] as int),
      creatorUID: json['creator_uid'] as String,
      recentMessage: json['recent_message'] as String? ?? '',
      recentMessageTime:
          fromJsonDateTimeNullable(json['recent_message_time'] as int?),
      recentMessageSender: json['recent_message_sender'] as String? ?? '',
      activeCallId: json['activeCallId'] as String?,
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'members': instance.members,
      'muted_members': instance.mutedMembers,
      'profile_pic': instance.profilePic,
      'created_at': toJsonDateTime(instance.createdAt),
      'creator_uid': instance.creatorUID,
      'recent_message': instance.recentMessage,
      'recent_message_time': toJsonDateTimeNullable(instance.recentMessageTime),
      'recent_message_sender': instance.recentMessageSender,
      'activeCallId': instance.activeCallId,
    };
