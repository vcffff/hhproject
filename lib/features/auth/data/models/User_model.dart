import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hhproject/features/auth/domain/entities/user_entity.dart'; 
part 'User_model.freezed.dart';
part 'User_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String name,
    required String email,
    required String id,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserMapper on UserModel {
  UserEntity toEntity() => UserEntity(id: id, name: name, email: email);
}