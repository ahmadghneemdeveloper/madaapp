class UserModel {
  String? phone_code;
  String? phone;
  String? password;

  UserModel({
    this.phone_code,
    this.phone,
    this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      // id: int.parse(jsonData['id']),
      phone_code: jsonData['phone_code'],
      phone: jsonData['phone'],
      password: jsonData['password']
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_code'] = phone_code;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
