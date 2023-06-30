import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/items/listcategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                top: -70,
                right: -25,
                child: Container(
                  width: size.width / 0.9,
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
              CustomAppBar(title: "Search Product", onTapSearch: () {}),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height / 5.4),
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
              CustomCategoriesItems()
            ],
          ),
        ],
      ),
    );
  }
}
