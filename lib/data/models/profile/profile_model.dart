import 'package:madaapp/domain/entities/profile/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone_code,
    required super.phone,
    required super.role,
    required super.code,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone_code: json['phone_code'],
      phone: json['phone'],
      role: json['role'],
      code: json['code'],
    );
  }
}
