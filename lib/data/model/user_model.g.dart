// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      login: json['login'] as String,
      avatar_url: json['avatar_url'] as String,
      followers: json['followers'] as int?,
      following: json['following'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatar_url,
      'followers': instance.followers,
      'following': instance.following,
    };
