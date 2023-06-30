import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/core/class/handlingData_view.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/items/customListItems.dart';
import 'package:e_commerce/view/widget/items/listcategories.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(ItemsControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cards,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomAppBar(
                title: "Search Product",
                onTapSearch: () {},
                color: AppColor.black.withOpacity(0.8),
                height: 1,
                width: 20,
              ),
            ),
            CustomCategoriesItems(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) {
                return HandleDataView(
                  statusRequest: controller.statusRequest!,
                  widget: CustomListItems(),
                );
              },
            ),
            // CustomListItems(),
          ],
        ),
      ),
    );
  }
}
