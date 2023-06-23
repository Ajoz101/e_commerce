import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

class MyServices extends GetxService {
  Future<MyServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }
}

initalServices() async{
  await Get.putAsync(() => MyServices().init());
}
