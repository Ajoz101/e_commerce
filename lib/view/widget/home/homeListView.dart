import 'package:e_commerce/view/widget/custom/customCard.dart';
import 'package:e_commerce/view/widget/home/CustomCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../custom/customAppBar.dart';
import 'CustomProductsForYou.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
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
                  gradient: LinearGradient(
                      colors: [AppColor.primaryLight, AppColor.second]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(160),
                    bottomRight: Radius.circular(160),
                  ),
                ),
              ),
            ),
            CustomAppBar(title: "Find Product"),
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
                          .copyWith(color: AppColor.white),
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
            Padding(
              padding: EdgeInsets.only(top: height / 5.3),
              child: GetBuilder<HomeControllerImp>(
                builder: (controller) => CustomCard(
                  title: "hey ${controller.username}",
                  subtitle: "GET A DISCOUNT\nNow!",
                  color: AppColor.secondLight,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
