import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/middleware/myMiddleware.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/forgotpass.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/resetpass.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/success_reset.dart';
import 'package:e_commerce/view/screen/auth/success_signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/verifycode.dart';
import 'package:e_commerce/view/screen/auth/checkemail.dart';
import 'package:e_commerce/view/screen/auth/verifycode_signup.dart';
import 'package:e_commerce/view/screen/onboard/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const OBoarding(),
      middlewares: [AwesomeMiddleWare()]),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgotpass, page: () => const ForgotPassword()),
  GetPage(name: AppRoutes.resetPass, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.successReset, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignedUp, page: () => const SuccessSignedUp()),
  GetPage(name: AppRoutes.checkEmail, page: () => const CheckEmail()),
  GetPage(
      name: AppRoutes.verifySignUP, page: () => const VerifyCodeForSignUp()),
];

// Map<String, Widget Function(BuildContext)> routess = {
//   AppRoutes.login: (p0) => const Login(),
//   AppRoutes.signup: (p0) => const SignUp(),
//   AppRoutes.forgotpass: (p0) => const ForgotPassword(),
//   AppRoutes.resetPass: (p0) => const ResetPassword(),
//   AppRoutes.verifyCode: (p0) => const VerifyCode(),
//   AppRoutes.successReset: (p0) => const SuccessResetPassword(),
//   AppRoutes.successSignedUp: (p0) => const SuccessSignedUp(),
//   AppRoutes.checkEmail: (p0) => const CheckEmail(),
//   AppRoutes.verifySignUP: (p0) => const VerifyCodeForSignUp(),
// };
