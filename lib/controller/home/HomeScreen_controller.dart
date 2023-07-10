import 'package:e_commerce/view/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../core/constant/nameOfRoutes.dart';
import '../../view/screen/home/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int current);
  gotoCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> page = const [
    Home(),
    Center(child: Text("Cart")),
    SettingScreen(),
    // FavoritesScreen(),
    Center(child: Text("Profile")),
  ];

  // List pageInfo = ['Home', 'Cart', "Faverite", 'Profile'];
  List bottaoppBarData = [
    {"title": "Home", "icon": FontAwesomeIcons.house},
    {"title": "Recent", "icon": FontAwesomeIcons.recycle},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "Profile", "icon": FontAwesomeIcons.userAstronaut},
  ];
  @override
  changePage(int current) {
    currentPage = current;
    // if (currentPage == 2) {
    //   fav.display();
    // }
    update();
  }

  @override
  gotoCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
