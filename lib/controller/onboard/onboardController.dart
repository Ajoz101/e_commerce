import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageC;
  int currentPage = 0;
  @override
  // MyServices service = Get.find();
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      sharedPref.setBool("seen", true);
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageC.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }

    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageC = PageController();
    super.onInit();
  }
}
