import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? phone_code;
  final String? phone;
  final String? role;
  final int? code;
  const ProfileEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone_code,
      required this.phone,
      required this.role,
      required this.code});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, phone_code, phone, role, code];
}
