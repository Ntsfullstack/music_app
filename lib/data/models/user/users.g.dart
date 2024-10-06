// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      gender: json['gender'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      likedSongs: json['likedSongs'] as List<dynamic>,
      playlists: json['playlists'] as List<dynamic>,
      isAdmin: json['isAdmin'] as bool,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'birthDate': instance.birthDate.toIso8601String(),
      'likedSongs': instance.likedSongs,
      'playlists': instance.playlists,
      'isAdmin': instance.isAdmin,
      '__v': instance.v,
    };
