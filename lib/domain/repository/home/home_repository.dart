import '../../../data/models/base_response/api_response.dart';

abstract class BaseHomeRepository {
  Future<ApiResponse> getDashboardInfo();
}