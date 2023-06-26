import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class VerifyForgotPasswordData {
  Crud crud;
  VerifyForgotPasswordData(this.crud);
  post({String?email,String? verify}) async {
    var resp = await crud.postData(AppLinks.verifyForgotPass, {
      "email": email,
      "verifycode":verify,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
