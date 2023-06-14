
import 'package:madaapp/data/models/profile/profile_model.dart';
import 'package:madaapp/domain/repository/profile/profile_repository.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base_response/api_response.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/base_response/response_model.dart';

class ProfileUseCase {
  final BaseProfileRepository baseProfileRepository;

  ProfileUseCase(this.baseProfileRepository);

  Future<ResponseModel<ProfileModel>> call({
    required context,
  }) async {
    ApiResponse apiResponse = await baseProfileRepository.getUserProfile();
    ResponseModel<ProfileModel> responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      if (baseModel.status == true) {
        ProfileModel data = ProfileModel.fromJson(baseModel.data);
        print("UserData => ${data}");
        responseModel = ResponseModel<ProfileModel>(
            true, apiResponse.response!.statusCode, baseModel.message,
            data: data);
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
          ApiChecker.checkApi(context, message: apiResponse.response!.statusMessage);
    }
    return responseModel;
  }
}
