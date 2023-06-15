import 'package:get/get.dart';

import '../../../presentation/splash/view/screens/splash_screen.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const SplashScreen(), fenix: true);
  }
}
