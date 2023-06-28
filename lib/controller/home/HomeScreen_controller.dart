import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/home/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int current);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> page = [
    Home(),
    Center(child: Text("Cart")),
    Center(child: Text("Fave")),
    Center(child: Text("Profile")),
  ];
  @override
  changePage(int current) {
    currentPage = current;
    update();
  }
}
