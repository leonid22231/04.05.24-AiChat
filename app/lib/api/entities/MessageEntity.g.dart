// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity(
      id: json['id'] as String,
      mode: $enumDecode(_$MessageModeEnumMap, json['mode']),
      type: $enumDecode(_$MessageTypeEnumMap, json['type']),
      content: json['content'] as String,
      send_time: DateTime.parse(json['send_time'] as String),
    );

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': _$MessageModeEnumMap[instance.mode]!,
      'type': _$MessageTypeEnumMap[instance.type]!,
      'content': instance.content,
      'send_time': instance.send_time.toIso8601String(),
    };

const _$MessageModeEnumMap = {
  MessageMode.Server: 'Server',
  MessageMode.User: 'User',
  MessageMode.Ai: 'Ai',
};

const _$MessageTypeEnumMap = {
  MessageType.Video: 'Video',
  MessageType.Audio: 'Audio',
  MessageType.Text: 'Text',
};
