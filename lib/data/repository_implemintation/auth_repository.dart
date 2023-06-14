import 'package:dio/dio.dart';
import 'package:madaapp/domain/repository/authentication/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../core/services/network/endpoints.dart';
import '../data_sourse/remote/dio/dio_client.dart';
import '../models/base_response/api_response.dart';

class AuthRepository implements BaseAuthenticationRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  AuthRepository({required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> login({
    required String? phone_code,
    required String? phone,
    required String? password,
  }) async {
    try {
      final response = await dioClient?.post(
        EndPoints.authenticateApi,
        body: {
          'phone_code': phone_code,
          'phone': phone,
          'password': password,
        },
      );

      // print("response.data ${response?.data}");
      return ApiResponse.withSuccess(response!);
    } on DioError catch (error) {
      if (error.response == null) {
        return ApiResponse.withError(ApiErrorHandler.getMessage(error));
      }
      return ApiResponse.withSuccess(error.response!);
    } catch (error) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(error));
    }
  }


}
