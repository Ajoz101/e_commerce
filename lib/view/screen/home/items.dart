import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/items/listcategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.cards,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CustomAppBar(
            title: "Search Product",
            onTapSearch: () {},
            color: AppColor.black.withOpacity(0.8),
            height: 1,
            width: 20,
          ),
          CustomCategoriesItems(),
        ],
      ),
    );
  }
}
