import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/custom/customCard.dart';
import 'package:e_commerce/view/widget/home/CustomCategories.dart';
import 'package:e_commerce/view/widget/home/CustomProductsForYou.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/functions/exitAlert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          return exitAlert();
        },
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Positioned(
                      top: -70,
                      right: -25,
                      child: Container(
                        width: width / 0.9,
                        height: 400,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 23, 126, 204),
                            AppColor.second
                          ]),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(160),
                            bottomRight: Radius.circular(160),
                          ),
                        ),
                      ),
                    ),
                    const CustomAppBar(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: height / 5.4),
                      child: GetBuilder<HomeControllerImp>(
                        builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Hello ${controller.username}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: AppColor.black),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width / 20, vertical: height / 2.4),
                      child: Text(
                        "For You",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: AppColor.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 5.3),
                      child: const CustomProds4You(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 5.3),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: width / 20, vertical: height / 1.7),
                        child: Text(
                          "Categories",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 5.3),
                      child: const CustomCategories(),
                    ),
                  ],
                ),

                /*
               * Categories 
               */

                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<HomeControllerImp>(
                  builder: (controller) => CustomCard(
                    title: "hey ${controller.username}",
                    subtitle: "GET A DISCOUNT\nNow!",
                    color: AppColor.secondLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
