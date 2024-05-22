// ignore: file_names
import 'package:json_annotation/json_annotation.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/MessageMode.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/MessageType.dart';

part 'MessageEntity.g.dart';

@JsonSerializable()
class MessageEntity {
  String id;
  MessageMode mode;
  MessageType type;
  String content;
  DateTime send_time;

  MessageEntity({required this.id, required this.mode, required this.type, required this.content, required this.send_time});

  factory MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
