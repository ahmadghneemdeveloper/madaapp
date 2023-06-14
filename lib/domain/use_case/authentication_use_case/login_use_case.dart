import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base_response/api_response.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/base_response/response_model.dart';
import '../../repository/authentication/authentication_repository.dart';

class LoginUseCase {
  final BaseAuthenticationRepository baseAuthRepository;

  LoginUseCase(this.baseAuthRepository);

  Future<ResponseModel> call({
    required context,
    required String? phone_code,
    required String? phone,
    required String? password,
  }) async {
    ApiResponse apiResponse = await baseAuthRepository.login(
      phone_code: phone_code,
      phone: phone,
      password: password,
    );
    ResponseModel responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      if (baseModel.status == true) {
        responseModel = ResponseModel<String>(
            true, apiResponse.response!.statusCode, baseModel.message,
            data: baseModel.data);
      }

      //200
      else {
        responseModel =
            ApiChecker.checkApi(context, message: baseModel.message);
      }
    } else {
      /*     ErrorResponse baseModel = ErrorResponse.fromJson(apiResponse.response!.data);
      final message = baseModel.message;*/

      print(apiResponse.response!.data.toString());
      responseModel =
          ApiChecker.checkApi(context, message: "apiResponse.response!.data");
    }
    return responseModel;
  }
}
