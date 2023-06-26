import 'package:e_commerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  String username = sharedPref.getString("username")!;
  String email = sharedPref.getString("email")!;
  String phone = sharedPref.getString("phone")!;
}
