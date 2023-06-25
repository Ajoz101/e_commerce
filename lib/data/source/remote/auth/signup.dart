import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  post({String ?username,String ?password,String? email,String ?phone}) async {
    var resp = await crud.postData(AppLinks.signup, {
      "username":username,
      "password": password,
      "email":email,
      "phone":phone,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
