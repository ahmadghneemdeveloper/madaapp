import 'package:flutter/material.dart';
import 'package:madaapp/data/models/home/home_model.dart';
import 'package:madaapp/domain/use_case/home/home_use_case.dart';
import '../../../../data/models/base_response/response_model.dart';


class HomeViewModel extends ChangeNotifier {
  final HomeUseCase _homeUseCase;

  HomeViewModel({
    required HomeUseCase homeUseCase,
  }) : _homeUseCase = homeUseCase;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ResponseModel<HomePageModel>? _homeData;

  ResponseModel<HomePageModel>? get homeData => _homeData;

  Future<ResponseModel<HomePageModel>> getHomeData({

    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    final responseModel = await _homeUseCase.call(
      context: context,
    );

    if (responseModel.isSuccess) {
      final data = responseModel.data!.toString();
      _homeData = responseModel.data as ResponseModel<HomePageModel>?;
      print("success pages Model home Data ${data}");
    } else {

      _isLoading = false;

      print("Fail pages Model ${responseModel.message}");
    }

    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}