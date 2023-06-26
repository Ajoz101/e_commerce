import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);
  post({String ?verifycode,String? email}) async {
    var resp = await crud.postData(AppLinks.verify, {
      "email":email,
      "verifycode": verifycode,
    
    });
    return resp.fold((l) => l, (r) => r);
  }
}
