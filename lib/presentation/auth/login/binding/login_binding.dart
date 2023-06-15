import 'package:get/get.dart';
import 'package:madaapp/core/class/crud.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
