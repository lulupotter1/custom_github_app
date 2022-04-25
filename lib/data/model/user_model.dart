import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String login;
  String avatar_url;
  int? followers;
  int? following;

  UserModel({
    required this.login,
    required this.avatar_url,
    this.followers,
    this.following,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
