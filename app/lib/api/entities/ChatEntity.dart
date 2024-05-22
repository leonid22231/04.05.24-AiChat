import 'package:json_annotation/json_annotation.dart';
import 'package:prime_ai_flutter_ui_kit/api/entities/MessageEntity.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/ChatModel.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/ChatTheme.dart';

part 'ChatEntity.g.dart';

@JsonSerializable()
class ChatEntity {
  String id;
  ChatTheme theme;
  ChatModel model;
  List<MessageEntity> messages;

  ChatEntity({required this.id, required this.model, required this.theme, required this.messages});

  factory ChatEntity.fromJson(Map<String, dynamic> json) => _$ChatEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
}
