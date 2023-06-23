import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (p0) => const Login(),
  AppRoutes.signup: (p0) => const SignUp(),
};
