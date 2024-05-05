// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:prime_ai_flutter_ui_kit/api/enums/UserGender.dart';

part 'UserEntity.g.dart';

@JsonSerializable()
class UserEntity {
  String email;
  bool subscription;
  UserSubType? subscription_type;
  String? name;
  String? phone_code;
  String? phone_number;
  String? photo;
  DateTime? date_of_birth;
  UserGender? gender;

  UserEntity({required this.email, required this.subscription, required this.subscription_type, this.name, this.phone_code, this.phone_number, this.photo, this.date_of_birth, this.gender});

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
