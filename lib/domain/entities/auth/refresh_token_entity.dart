import 'package:equatable/equatable.dart';

class RefreshTokenEntity extends Equatable {
  final String? token;


  const RefreshTokenEntity({
    required this.token,

  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        token,

      ];
}
