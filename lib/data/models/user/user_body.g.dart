// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthBody _$AuthBodyFromJson(Map<String, dynamic> json) => AuthBody(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$AuthBodyToJson(AuthBody instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
    };
