import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/forgotpass.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/resetpass.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/success_reset.dart';
import 'package:e_commerce/view/screen/auth/success_signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/verifycode.dart';
import 'package:e_commerce/view/screen/auth/checkemail.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (p0) => const Login(),
  AppRoutes.signup: (p0) => const SignUp(),
  AppRoutes.forgotpass: (p0) => const ForgotPassword(),
  AppRoutes.resetPass: (p0) => const ResetPassword(),
  AppRoutes.verifyCode: (p0) => const VerifyCode(),
  AppRoutes.successReset: (p0) => const SuccessResetPassword(),
  AppRoutes.successSignedUp: (p0) => const SuccessSignedUp(),
  AppRoutes.checkEmail: (p0) => const CheckEmail(),
};
