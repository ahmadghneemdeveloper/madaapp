import 'package:get/get.dart';
import 'package:madaapp/presentation/splash/view_model/SplashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
    );
  }
}
