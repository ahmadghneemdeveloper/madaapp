
import 'package:madaapp/domain/entities/auth/refresh_token_entity.dart';

class RefreshTokenModel extends RefreshTokenEntity {
  const RefreshTokenModel({
    required super.token,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic>? json) {
    return RefreshTokenModel(
      token: json?['token'],
    );
  }
}
