import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  post({String?password,String? email}) async {
    var resp = await crud.postData(AppLinks.login, {
      "password": password,
      "email":email,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
