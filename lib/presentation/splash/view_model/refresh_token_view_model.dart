// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../../data/models/base_response/response_model.dart';
// import '../../../../../domain/use_case/local_use_cases/save_token_usecase.dart';
// import '../../../core/services/local/shared_preferences_keys.dart';
// import '../../../data/models/auth_model/refresh_token_model.dart';
// import '../../../domain/logger.dart';
// import '../../../domain/use_case/authentication_use_case/refresh_token_use_case.dart';
//
// class RefreshTokenViewModel extends ChangeNotifier {
//   final RefreshTokenUseCase _refreshTokenUseCase;
//   final SaveTokenDataUseCase _saveUserTokenUseCase;
//
//   RefreshTokenViewModel({
//     required RefreshTokenUseCase loginUseCase,
//     required SaveTokenDataUseCase saveTokenDataUseCase,
//    })  : _refreshTokenUseCase = loginUseCase,
//         _saveUserTokenUseCase = saveTokenDataUseCase;
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   Future<ResponseModel<RefreshTokenModel>> refreshToken({
//     required BuildContext context,
//   }) async {
//     _isLoading = true;
//     notifyListeners();
//
//     final responseModel = await _refreshTokenUseCase.call(
//       context: context,
//     );
//
//     if (responseModel.isSuccess) {
//       String? token = responseModel.data!.token.toString();
//       print("success view Model token ${token}");
//       print(
//           "success view Model Expires ${responseModel.data!.expires.toString()}");
//       _saveUserTokenUseCase.call(token: token);
//       _saveTokenExpirationDataUseCase.call(
//           expirationDate: responseModel.data!.expires.toString());
//       // _saveUserDataUseCase.call(userModel: responseModel.data!);
//
//     } else {
//       print("Fail view Model ${responseModel.message}");
//     }
//
//     _isLoading = false;
//     notifyListeners();
//     return responseModel;
//   }
//
//   Future<bool> tokenExpirationCheck({
//     required BuildContext context,
//   }) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     final kTokenExpirationDate =
//     sharedPreferences.getString(SharedPreferencesKeys.kTokenExpirationDate);
//
//     bool? status;
//     // print("DateTime.now = ${DateTime.now()}");
//     DateTime myDateTime = DateTime.parse(kTokenExpirationDate!);
//     if (myDateTime.isBefore(DateTime.now())) {
//       await refreshToken(context: context);
//       status = true;
//       log("TokenStatus", "Token Is Not Valid");
//     } else {
//       log("TokenStatus", "Token is Valid");
//
//       status = false;
//     }
//     return status;
//   }
// }
