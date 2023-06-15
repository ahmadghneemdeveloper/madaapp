
import 'package:get_storage/get_storage.dart';
import 'package:madaapp/data/models/user_model.dart';

class LocalDataHelper {
  var box = GetStorage();

  saveUserAllData(UserModel userModel) async {
    await box.write('user', userModel.toJson());
  }

  UserModel? getUserAllData() {
    var userModel = box.read('user');
    print(userModel);
    return userModel != null ? UserModel.fromJson(userModel) : null;
  }

  void saveUserToken(String token) async {
    await box.write('token', token);
  }

  String? getUserToken() {
    String? token = box.read("token");
    return token;
  }



}
