import 'package:madaapp/data/models/auth_model/auth_model.dart';

import '../../../data/models/base_response/response_model.dart';
import '../../logger.dart';
import '../../repository/local_repository/local_repo.dart';

class GetUserDataUseCase {
  final _tag = 'GetUserDataUseCase';
  final LocalRepository repository;

  GetUserDataUseCase({required this.repository});

  Future<ResponseModel> call() async {
    AuthModel? userModel = repository.getUserData();

    if (userModel != null) {
      log(_tag, userModel.toString());
      return ResponseModel(true, 200,'successful getting user data',
          data: userModel);
    } else {
      return ResponseModel(false,200, 'error while fetching user data');
    }
  }
}
