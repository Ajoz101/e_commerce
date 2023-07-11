import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/class/handlingData_view.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/view/widget/custom/customCard.dart';
import 'package:e_commerce/view/widget/home/CustomCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorites/favorites_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';
import '../custom/customAppBar.dart';
import 'CustomProductsForYou.dart';
import 'itemSearch.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return ListView(
          shrinkWrap: true, physics: BouncingScrollPhysics(),

          /// Removes the padding from all sides.
          children: [
            SizedBox(
              height: Get.width / 19,
            ),
            CustomAppBar(
              title: "Search",
              height: 24,
              width: 40,
              color: AppColor.primary.withOpacity(0.7),
              showRow: true,
              searchController: controller.search!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onTapSearch: () {
                controller.onSearchItems();
              },
            ),
            !controller.isSearched
                ? ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: Get.height / 12),
                      CustomCardOffer(
                        title: "Get a discount now\n ${controller.username}",
                        subtitle: "Take a look for latest\n products",
                        color: AppColor.primary,
                      ),
                      SizedBox(height: Get.height / 12),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Text(
                          "Categories",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.black),
                        ),
                      ),
                      const CustomCategories(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Text(
                          "For You",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: AppColor.black),
                        ),
                      ),
                      const CustomProds4You(),
                    ],
                  )
                : HandleDataView(
                    statusRequest: controller.statusRequest!,
                    widget: SearchedItems(
                        listdata: controller.searchedData,
                        controller: controller),
                  ),
          ],
        );
      },
    );
  }
}
