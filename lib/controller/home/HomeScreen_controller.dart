import 'package:e_commerce/controller/favorites/favorites_controller.dart';
import 'package:e_commerce/view/screen/favorites/favorites.dart';
import 'package:e_commerce/view/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    SettingScreen(),
    // FavoritesScreen(),
    Center(child: Text("Profile")),
  ];

  // List pageInfo = ['Home', 'Cart', "Faverite", 'Profile'];
  List bottaoppBarData = [
    {"title": "Home", "icon": Icons.home_outlined},
    {"title": "Cart", "icon": Icons.card_travel_outlined},
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
}
