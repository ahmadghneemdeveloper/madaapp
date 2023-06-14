import '../../../domain/entities/auth/auth_entity.dart';


class AuthModel extends AuthEntity {
  const AuthModel({
    required super.id,
    required super.phone,
    required super.phone_code,
    required super.password

  });

  factory AuthModel.fromJson(Map<String, dynamic>? json) {
    return AuthModel(
      id: json?['id'],
      phone: json?['phone'],
      phone_code: json?['phone_code'],
        password: json?['password']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone']=phone;
    data['phone_code']=phone_code;
    data['password']=password;
    return data;
  }
}
