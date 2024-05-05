// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      email: json['email'] as String,
      subscription: json['subscription'] as bool,
      subscription_type:
          $enumDecodeNullable(_$UserSubTypeEnumMap, json['subscription_type']),
      name: json['name'] as String?,
      phone_code: json['phone_code'] as String?,
      phone_number: json['phone_number'] as String?,
      photo: json['photo'] as String?,
      date_of_birth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'subscription': instance.subscription,
      'subscription_type': _$UserSubTypeEnumMap[instance.subscription_type],
      'name': instance.name,
      'phone_code': instance.phone_code,
      'phone_number': instance.phone_number,
      'photo': instance.photo,
      'date_of_birth': instance.date_of_birth?.toIso8601String(),
      'gender': _$UserGenderEnumMap[instance.gender],
    };

const _$UserSubTypeEnumMap = {
  UserSubType.type1: 'type1',
  UserSubType.type2: 'type2',
  UserSubType.type3: 'type3',
  UserSubType.type4: 'type4',
};

const _$UserGenderEnumMap = {
  UserGender.Male: 'Male',
  UserGender.Female: 'Female',
};
