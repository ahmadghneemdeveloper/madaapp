// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../core/exceptions/api_error_handler.dart';
// import '../../core/services/network/endpoints.dart';
// import '../data_sourse/remote/dio/dio_client.dart';
// import '../models/base_response/api_response.dart';
//
// class NotificationsRepository implements BaseNotificationRepository {
//   final DioClient? dioClient;
//   final SharedPreferences? sharedPreferences;
//
//   NotificationsRepository(
//       {required this.dioClient, required this.sharedPreferences});
//
//   @override
//   Future<ApiResponse> getNotifications() async {
//     try {
//       final response = await dioClient?.post(
//         EndPoints.notificationsApi,
//       );
//       print("response.data ${response?.data}");
//       return ApiResponse.withSuccess(response!);
//     } on DioError catch (error) {
//       if (error.response == null) {
//         return ApiResponse.withError(ApiErrorHandler.getMessage(error));
//       }
//       return ApiResponse.withSuccess(error.response!);
//     } catch (error) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(error));
//     }
//   }
// }
