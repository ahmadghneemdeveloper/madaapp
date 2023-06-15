import 'package:madaapp/core/services/getx_services/link.dart';
import '../../../core/class/crud.dart';


class RegisterData {
  Crud crud;
  RegisterData(this.crud);
  postData(String phone_code, String phone,String password) async {
    var response = await crud.postData(
      AppLink.login,
      {"phone_code": phone_code, "phone": phone,"password":password},
      getHeader(),
    );
    print("ssssssssssss");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
