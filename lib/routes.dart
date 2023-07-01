import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/middleware/myMiddleware.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/forgotpass.dart';
import 'package:e_commerce/view/screen/auth/login.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/resetpass.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/success_reset.dart';
import 'package:e_commerce/view/screen/auth/success_signup.dart';
import 'package:e_commerce/view/screen/auth/forgotPasswordFolder/verifycode.dart';
import 'package:e_commerce/view/screen/auth/verifycode_signup.dart';
import 'package:e_commerce/view/screen/home/HomeScreen.dart';
import 'package:e_commerce/view/screen/home/home.dart';
import 'package:e_commerce/view/screen/home/items.dart';
import 'package:e_commerce/view/screen/onboard/onboarding.dart';
import 'package:e_commerce/view/screen/items/itemsDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/",
  //     page: () => TestApi()),
  GetPage(
      name: "/",
      page: () => const OBoarding(),
      middlewares: [AwesomeMiddleWare()]),
  // GetPage(
  //     name: "/",
  //     page: () => const ItemsDetails()),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.signup,
    page: () => const SignUp(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.forgotpass,
    page: () => const ForgotPassword(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.resetPass,
    page: () => const ResetPassword(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.verifyCode,
    page: () => const VerifyCode(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.successReset,
    page: () => const SuccessResetPassword(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.successSignedUp,
    page: () => const SuccessSignedUp(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.verifySignUP,
    page: () => const VerifyCodeForSignUp(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fade,
  ),

  // Home
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
    transitionDuration: const Duration(milliseconds: 400),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoutes.items,
    page: () => const ItemsPage(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: AppRoutes.itemsDetails,
    page: () => const ItemsDetails(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.fadeIn,
  ),
];
