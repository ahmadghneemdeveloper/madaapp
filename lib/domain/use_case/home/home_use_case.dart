import 'package:madaapp/data/models/home/home_model.dart';
import 'package:madaapp/domain/repository/home/home_repository.dart';

import '../../../core/exceptions/api_checker.dart';
import '../../../data/models/base_response/api_response.dart';
import '../../../data/models/base_response/base_model.dart';
import '../../../data/models/base_response/response_model.dart';
class HomeUseCase {
  late final BaseHomeRepository baseHomeRepository;

  HomeUseCase(this.baseHomeRepository);

  Future<ResponseModel<HomePageModel>> call({
    required context,
  }) async {
    ApiResponse apiResponse = await baseHomeRepository.getDashboardInfo();
    ResponseModel<HomePageModel> responseModel;

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
      if (baseModel.status == true) {
        print("HomeUseCase => ${baseModel.data}");
        HomePageModel data = HomePageModel.fromJson(baseModel.data);
        print("HomeUseCase => ${baseModel.data}");
        responseModel =
            ResponseModel<HomePageModel>(true,apiResponse.response!.statusCode, baseModel.message, data: data);
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