import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final int? id;
  final String? phone;
  final String? phone_code;
  final String? password;


  const AuthEntity({
    required this.id,
    required this.phone,
    required this.phone_code,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    phone,
    phone_code,
    password
  ];
}