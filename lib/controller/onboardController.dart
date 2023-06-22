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
  next() {
    currentPage++;
    pageC.animateToPage(currentPage,
        duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
    update();
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    pageC = PageController();
    super.onInit();
  }
}
