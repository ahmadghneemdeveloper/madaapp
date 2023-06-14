// import 'package:flutter/material.dart';
// import 'package:madaapp/domain/use_case/authentication_use_case/login_use_case.dart';
//
// import '../../../../data/models/base_response/response_model.dart';
// import '../../../../domain/use_case/local_use_cases/save_data_usecase.dart';
//
// class LoginViewModel extends ChangeNotifier {
//   final LoginUseCase _signInUseCase;
//   final SaveTokenDataUseCase _saveUserTokenUseCase;
//
//   LoginViewModel({
//     required LoginUseCase loginUseCase,
//     required SaveTokenDataUseCase saveTokenDataUseCase,
//   })
//       : _signInUseCase = loginUseCase,
//         _saveUserTokenUseCase = saveTokenDataUseCase;
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   Future<ResponseModel> login({
//     required BuildContext context,
//     required String email,
//     required String password,
//   }) async {
//     _isLoading = true;
//     notifyListeners();
//
//     final responseModel = await _signInUseCase.call(
//       context: context,
//       email: email,
//       password: password,
//     );
//
//     if (responseModel.isSuccess) {
//       String? token = responseModel.data!.toString();
//       print("success view Model token ${token}");
//       print("success view Model data ${responseModel.data}");
//        _saveUserTokenUseCase.call(token: token);
//      // _saveUserDataUseCase.call(userModel: responseModel.data!);
//
//     } else {
//       print("Fail view Model ${responseModel.message}");
//     }
//
//     _isLoading = false;
//     notifyListeners();
//     return responseModel;
//   }
// }
