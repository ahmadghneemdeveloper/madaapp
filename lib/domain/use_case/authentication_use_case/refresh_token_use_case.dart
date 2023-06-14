// import 'package:madaapp/data/models/auth_model/refresh_token_model.dart';
//
// import '../../../core/exceptions/api_checker.dart';
// import '../../../data/models/base_response/api_response.dart';
// import '../../../data/models/base_response/base_model.dart';
// import '../../../data/models/base_response/response_model.dart';
// import '../../repository/authentication/authentication_repository.dart';
//
// class RefreshTokenUseCase {
//   final BaseAuthenticationRepository baseAuthRepository;
//
//   RefreshTokenUseCase(this.baseAuthRepository);
//
//   Future<ResponseModel<RefreshTokenModel>> call({
//     required context,
//   }) async {
//     ApiResponse apiResponse = await baseAuthRepository.refreshToken();
//     ResponseModel<RefreshTokenModel> responseModel;
//
//     if (apiResponse.response != null &&
//         apiResponse.response!.statusCode == 200) {
//       BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
//       if (baseModel.status == true) {
//         RefreshTokenModel data = RefreshTokenModel.fromJson(baseModel.data);
//         responseModel = ResponseModel<RefreshTokenModel>(
//             true,apiResponse.response!.statusCode, baseModel.message,
//             data: data);
//       }
//       //200
//       else {
//         responseModel = ApiChecker.checkApi(context, message: baseModel.error);
//       }
//     } else {
//       /*     ErrorResponse baseModel = ErrorResponse.fromJson(apiResponse.response!.data);
//       final message = baseModel.message;*/
//
//       print(apiResponse.response?.data.toString());
//       responseModel =
//           ApiChecker.checkApi(context, message: "apiResponse.response!.data");
//     }
//     return responseModel;
//   }
// }