// import 'package:madaapp/data/models/home/home_model.dart';
// import 'package:madaapp/data/models/reservations/reservations_model.dart';
// import 'package:madaapp/domain/repository/reservations_repository/reservations_repository.dart';
// import '../../../core/exceptions/api_checker.dart';
// import '../../../data/models/base_response/api_response.dart';
// import '../../../data/models/base_response/base_model.dart';
// import '../../../data/models/base_response/response_model.dart';
// class ReservationsUseCase {
//   late final BaseReservationsRepository baseReservationsRepository;
//
//   ReservationsUseCase(this.baseReservationsRepository);
//
//   Future<ResponseModel<ReservationsPageModel>> call({
//     required context,
//   }) async {
//     ApiResponse apiResponse = await baseReservationsRepository.getReservations();
//     ResponseModel<ReservationsPageModel> responseModel;
//
//     if (apiResponse.response != null &&
//         apiResponse.response!.statusCode == 200) {
//     BaseModel baseModel = BaseModel.fromJson(apiResponse.response!.data);
//       if (baseModel.status == true) {
//         print("HomeUseCase => ${baseModel.data}");
//         HomePageModel data = HomePageModel.fromJson(baseModel.data);
//         print("HomeUseCase => ${baseModel.data}");
//         responseModel =
//             ResponseModel<ReservationsPageModel>(true,apiResponse.response!.statusCode, baseModel.message, data: data);
//       }
//       //200
//       else {
//         responseModel =
//             ApiChecker.checkApi(context, message: baseModel.message);
//       }
//     } else {
//       /*     ErrorResponse baseModel = ErrorResponse.fromJson(apiResponse.response!.data);
//       final message = baseModel.message;*/
//
//       print(apiResponse.response!.data.toString());
//       responseModel =
//           ApiChecker.checkApi(context, message: "apiResponse.response!.data");
//     }
//     return responseModel;
//   }
// }