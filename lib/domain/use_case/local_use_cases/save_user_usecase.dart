  import '../../../data/models/auth_model/auth_model.dart';
import '../../../data/models/base_response/response_model.dart';
import '../../logger.dart';
import '../../repository/local_repository/local_repo.dart';

class SaveUserDataUseCase {
  final _tag = 'SaveUserDataUseCase';
  final LocalRepository repository;

  SaveUserDataUseCase({required this.repository});

  Future<ResponseModel> call({
    required AuthModel userModel,
    // required UserModel userModel,
  }) async {
    log(_tag, 'save email = ${userModel.phone} }');
    bool isSaveToken = await repository.saveUserData(userModel);
    // bool isSaveUser = await repository.saveUserData(userModel);
    if (isSaveToken) {
      log(_tag, 'save data successful');
      return ResponseModel(true, 200,'successful saving user data successful ');
    } else {
      return ResponseModel(false, 200,'error while saving user data');
    }
  }
}
