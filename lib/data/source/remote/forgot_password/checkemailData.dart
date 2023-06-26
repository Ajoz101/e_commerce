import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  post({String? email}) async {
    var resp = await crud.postData(AppLinks.checkemail, {
      
      "email":email,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
