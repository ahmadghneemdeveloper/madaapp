import 'dart:convert';
import 'package:madaapp/data/models/auth_model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/local/shared_preferences_keys.dart';
import '../../../domain/repository/local_repository/local_repo.dart';
import '../../data_sourse/remote/dio/dio_client.dart';


class LocalRepositoryImp implements LocalRepository {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  LocalRepositoryImp(
      {required this.sharedPreferences, required this.dioClient});



  @override
  String getUserToken() {
    return sharedPreferences!.getString(SharedPreferencesKeys.kToken) ?? "";
  }

  @override
  bool isLoggedIn() {
    print('--------User Token---------- ');
    return sharedPreferences!.containsKey(SharedPreferencesKeys.kToken);
  }

  @override
  Future<bool> clearSharedData() async {
    dioClient!.token = '';
    dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      'Content-Language': /*appContext?.locale.languageCode ??*/ 'ar',
      'Authorization': ''
    };
    return await sharedPreferences!.clear();
  }

//  for  user token
  @override
  Future<bool> saveUserToken(String token) async {
    dioClient!.token = token;
    dioClient!.dio!.options.headers = {
      'Accept': 'application/json; charset=UTF-8',
      //'Content-Language': /*appContext?.locale.languageCode ??*/ 'ar',
      'Authorization': 'Bearer $token'
    };
    try {
      return await sharedPreferences!.setString(SharedPreferencesKeys.kToken, token);
    } catch (e) {
      return false;
    }
  }


  @override
  AuthModel? getUserData() {
    String? user =
        sharedPreferences!.getString(SharedPreferencesKeys.kUserData);
    return user != null ? AuthModel.fromJson(jsonDecode(user)) : null;
  }

  @override
  Future<bool> saveUserData(AuthModel userModel) {
    String user = jsonEncode(userModel.toJson());

    return sharedPreferences!.setString(SharedPreferencesKeys.kUserData, user);
  }
}
