import 'package:json_annotation/json_annotation.dart';

part 'user_register_model.g.dart';

@JsonSerializable()
class UserRegisterModel {
  String fullName;
  String email;
  String password;
  UserRegisterModel(
      {required this.fullName, required this.email, required this.password});
  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterModelToJson(this);
}
