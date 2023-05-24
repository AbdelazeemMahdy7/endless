import 'package:endless/domain/entity/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.name,
    required super.email,
    required super.type,
    required super.status,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      email: json['email'],
      type: json['type'],
      status: json['status'],
    );
  }
}
