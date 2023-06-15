import 'package:get/get.dart';
import 'package:madaapp/core/resources/shared_preferences_keys.dart';
import 'package:madaapp/core/services/getx_services/service.dart';

import '../../../config/navigation/routes.dart';
class SplashController extends GetxController {
  MyServices myServices = Get.find();
  // var user;
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() async {
    Future.delayed(const Duration(seconds: 5), () {
      if (myServices.sharedPreferences
          .getBool(SharedPreferencesKeys.isLoginKey) ==
          true) {
        Get.toNamed(Routes.homeScreen);
      } else {
        Get.toNamed(Routes.loginScreen);
      }
    });
  }
  @override
  void onClose() {
    super.onClose();
  }
}
