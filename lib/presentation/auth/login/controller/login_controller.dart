import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madaapp/core/class/statusrequest.dart';
import 'package:madaapp/core/resources/constant_data.dart';
import 'package:madaapp/core/resources/shared_preferences_keys.dart';
import 'package:madaapp/core/services/getx_services/service.dart';
import 'package:madaapp/data/data_sourse/remote/registeration.dart';
import '../../../../config/navigation/routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late TextEditingController phone_code = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  onChanageFlag( newValue){
    newValue =newValue;
    update();

  }
@override
  void dispose() {

  phone_code.dispose();
  phone.dispose();
  password.dispose();
  // TODO: implement dispose
    super.dispose();
  }

  @override
  void onInit() {
    phone_code.text = '';
    phone.text = '';
    password.text='';
    super.onInit();
  }

  RegisterData registerData = RegisterData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  registerRepo() async {
    print('${phone_code.text}+++${phone.text}++++++${password.text}');
    var response = await registerData.postData(
      phone_code.text,
      phone.text,
      password.text
    );
    print("=============================== Controller $response ");
    ConstData.isLogin = true;
    ConstData.token = response["token"];
    myServices.sharedPreferences
        .setString(SharedPreferencesKeys.tokenKey, response['token']);

    myServices.sharedPreferences
        .setBool(SharedPreferencesKeys.isLoginKey, true);

    Get.offAllNamed(Routes.homeScreen);
    update();
  }
}

