import '../../../data/models/base_response/api_response.dart';

abstract class BaseProfileRepository {
  Future<ApiResponse> getUserProfile();
}
