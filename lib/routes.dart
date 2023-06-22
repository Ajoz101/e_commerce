import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (p0) => const Login(),
};
