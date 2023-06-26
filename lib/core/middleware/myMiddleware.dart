import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwesomeMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPref.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.home);
    }
    if (sharedPref.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.login);
    }
  }
}
