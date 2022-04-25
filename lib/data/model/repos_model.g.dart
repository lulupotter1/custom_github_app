// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReposModel _$ReposModelFromJson(Map<String, dynamic> json) => ReposModel(
      name: json['name'] as String,
      private: json['private'] as bool,
      description: json['description'] as String?,
      created_at: json['created_at'] as String?,
      visibility: json['visibility'] as String?,
      owner: UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      forks_count: json['forks_count'] as int,
      stargazers_count: json['stargazers_count'] as int,
      permissions:
          PermissionModel.fromJson(json['permissions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReposModelToJson(ReposModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'private': instance.private,
      'description': instance.description,
      'created_at': instance.created_at,
      'visibility': instance.visibility,
      'owner': instance.owner,
      'forks_count': instance.forks_count,
      'stargazers_count': instance.stargazers_count,
      'permissions': instance.permissions,
    };
