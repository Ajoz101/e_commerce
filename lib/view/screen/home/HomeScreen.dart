import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/home/customappButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/HomeScreen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            shape: CircularNotchedRectangle(),
            color: AppColor.second,
            child: Row(
              children: [
                Row(
                  children: [
                    CustomAppButton(
                        active: controller.currentPage == 0 ? true : false,
                        title: "Home",
                        onPressed: () {
                          controller.changePage(0);
                        },
                        icon: Icons.house_outlined),
                    CustomAppButton(
                        active: controller.currentPage == 1 ? true : false,
                        title: "Cart",
                        onPressed: () {
                          controller.changePage(1);
                        },
                        icon: Icons.shopping_cart_outlined)
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    CustomAppButton(
                        active: controller.currentPage == 2 ? true : false,
                        title: "Favorite",
                        onPressed: () {
                          controller.changePage(2);
                        },
                        icon: FontAwesomeIcons.heart),
                    CustomAppButton(
                        active: controller.currentPage == 3 ? true : false,
                        title: "Profile",
                        onPressed: () {
                          controller.changePage(3);
                        },
                        icon: FontAwesomeIcons.user),
                  ],
                ),
              ],
            )),
        body: controller.page.elementAt(controller.currentPage),
      );
    });
  }
}
