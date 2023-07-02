import 'package:e_commerce/view/screen/favorites/favorites.dart';
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
    const FavoritesScreen(),
    Center(child: Text("Profile")),
  ];

  List pageInfo = ['Home', 'Cart', "Faverite", 'Profile'];
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.favorite_border,
    Icons.person_outline
  ];
  @override
  changePage(int current) {
    currentPage = current;
    update();
  }
}
