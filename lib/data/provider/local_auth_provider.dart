import 'package:flutter/material.dart';
import 'package:madaapp/data/models/auth_model/auth_model.dart';
import '../../domain/use_case/local_use_cases/clear_user_data_usecase.dart';
import '../../domain/use_case/local_use_cases/get_is_login_usecase.dart';
import '../../domain/use_case/local_use_cases/get_user_data_usecase.dart';
import '../models/base_response/response_model.dart';

class LocalAuthProvider with ChangeNotifier {
  bool _isLogin = false;

  //TODO remove this value
  AuthModel? _user;

  final GetIsUserLoginUseCase getIsUserLoginUseCase;
  final GetUserDataUseCase getUserDataUseCase;
  final ClearUserDataUseCase clearUserDataUseCase;

  LocalAuthProvider({
    required this.getIsUserLoginUseCase,
    required this.getUserDataUseCase,
    required this.clearUserDataUseCase,
  });

  AuthModel? get user => _user;

  ResponseModel<AuthModel?>? get userData => _userData;

  ResponseModel<AuthModel?>? _userData;

  bool get isAuth => _isLogin;

  Future<bool> isLogin() async {
    ResponseModel responseModel = await getIsUserLoginUseCase.call();
    if (responseModel.isSuccess) {
      _isLogin = true;
      await getUserData();
    } else {}
    return responseModel.isSuccess;
  }

  Future<bool> getUserData() async {
    ResponseModel responseModel = await getUserDataUseCase.call();
    if (responseModel.isSuccess) {
      _user = responseModel.data;
    }
    return responseModel.isSuccess;
  }

  Future<bool> logOut() async {
    ResponseModel responseModel = await clearUserDataUseCase.call();
    if (responseModel.isSuccess) {
      _isLogin = false;
      _user = null;
    }
    return responseModel.isSuccess;
  }
}
