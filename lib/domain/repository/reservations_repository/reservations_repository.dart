import '../../../data/models/base_response/api_response.dart';

abstract class BaseReservationsRepository {
  Future<ApiResponse> getReservations();
}