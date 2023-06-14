
import 'package:madaapp/data/models/auth_model/auth_model.dart';

abstract class LocalRepository {
  Future<bool> saveUserToken(String token);
  Future<bool> saveUserData(AuthModel userModel);

  String getUserToken();
  AuthModel? getUserData();
  bool isLoggedIn();
  Future<bool> clearSharedData();
}
