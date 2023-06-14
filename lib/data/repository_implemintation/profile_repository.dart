import 'package:dio/dio.dart';
import 'package:madaapp/domain/repository/profile/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/exceptions/api_error_handler.dart';
import '../../core/services/network/endpoints.dart';
import '../data_sourse/remote/dio/dio_client.dart';
import '../models/base_response/api_response.dart';

class ProfileRepository implements BaseProfileRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  ProfileRepository({required this.dioClient, required this.sharedPreferences});

  @override
  Future<ApiResponse> getUserProfile() async {
    try {
      final response = await dioClient?.get(
        EndPoints.profileApi,
        options: Options(headers: {'Authorization': 'Bearer 84|ztl1Aje3CDZBhUPlXc3YEoZeo1lFQtGRWNvVZkVh'}),
      );

      print("response.data ${response?.data}");
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
