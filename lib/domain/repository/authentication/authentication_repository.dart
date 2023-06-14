import '../../../data/models/base_response/api_response.dart';

mixin BaseAuthenticationRepository {
  Future<ApiResponse> login({
    required String? phone_code,
    required String? phone,
    required String? password,
  });

}
