import 'package:json_annotation/json_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  bool admin;
  bool maintain;
  bool push;
  bool triage;
  bool pull;

  PermissionModel({
    required this.admin,
    required this.maintain,
    required this.pull,
    required this.push,
    required this.triage,
  });
  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
