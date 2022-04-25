import 'package:custom_github_app/data/model/permission_model.dart';
import 'package:custom_github_app/data/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repos_model.g.dart';

@JsonSerializable()
class ReposModel {
  String name;
  bool private;
  String? description;
  String? created_at;
  String? visibility;
  UserModel owner;
  int forks_count;
  int stargazers_count;
  PermissionModel permissions;

  ReposModel({
    required this.name,
    required this.private,
    this.description,
    this.created_at,
    this.visibility,
    required this.owner,
    required this.forks_count,
    required this.stargazers_count,
    required this.permissions,
  });

  factory ReposModel.fromJson(Map<String, dynamic> json) =>
      _$ReposModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReposModelToJson(this);
}
