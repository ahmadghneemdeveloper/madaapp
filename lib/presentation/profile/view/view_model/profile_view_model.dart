import 'package:flutter/material.dart';
import 'package:madaapp/data/models/profile/profile_model.dart';
import 'package:madaapp/domain/use_case/profile/profile_use_case.dart';
import '../../../../data/models/base_response/response_model.dart';


class ProfileViewModel extends ChangeNotifier {
  final ProfileUseCase _profileUseCase;

  ProfileViewModel({
    required ProfileUseCase profileUseCase,
  }) : _profileUseCase = profileUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ResponseModel<ProfileModel>? _profileData;

  ResponseModel<ProfileModel>? get profileData => _profileData;

  Future<ResponseModel<ProfileModel>> getProfileData({
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    final responseModel = await _profileUseCase.call(
      context: context,
    );

    if (responseModel.isSuccess) {
      final data = responseModel.data!.toString();
      _profileData = responseModel;
      print("success pages Model profile Data ${data}");
    } else {


      _isLoading = true;

      print("Fail pages Model ${responseModel.message}");
    }

    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
