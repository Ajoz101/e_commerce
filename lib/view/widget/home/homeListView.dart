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

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandleDataView(
        statusRequest: controller.statusRequest!,
        widget: ListView(
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
                : SearchedItems(listdata: controller.searchedData, controller: controller),
          ],
        ),
      );
    });
  }
}

class SearchedItems extends StatelessWidget {
  const SearchedItems({super.key, required this.listdata, required this.controller});
  final List<ItemsModel> listdata;
  final HomeControllerImp controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.searchedData.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
      onTap: () {
        // controller.gotoDetails(itemsModel!);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 250,
        child: Card(
          color: AppColor.black.withOpacity(0.8),
          elevation: 40,
          child: Container(
            height: 200,
            child: Column(
              children: [
                Hero(
                  tag: "${listdata[index].itemsId}",
                  child: Container(
                    width: Get.width / 5,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ImageLink.items}/${listdata[index].itemsImage.toString()}",
                      // width: size.width / 4,
                      fit: BoxFit.contain,
                      height: Get.height / 11,
                    ),
                  ),
                ),
                Text(
                  listdata[index].itemsName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width / 20,
                      color: AppColor.second),
                ),
                Text(
                  "${listdata[index].itemsPrice.toString()}\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: Get.width / 18,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height / 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<FavoriteController>(
                        init: FavoriteController(),
                        builder: (controller) {
                        return IconButton(
                          splashColor: AppColor.second,
                          onPressed: () {
                            if (controller.isFavorite[listdata[index].itemsId] ==
                                "0") {
                              controller.setFavorite(listdata[index].itemsId, "1");
                              controller
                                  .addFave(listdata[index].itemsId.toString());
                            } else {
                              controller.setFavorite(listdata[index].itemsId, "0");
                              controller.removeFave(
                                  listdata[index].itemsId.toString(),
                                  listdata[index].itemsName.toString());
                            }
                            print(listdata[index].itemsId);
                          },
                          icon: Icon(
                            controller.isFavorite[listdata[index].itemsId] == "1"
                                ? Icons.bookmark_added
                                : Icons.bookmark_add_outlined,
                            color: AppColor.second,
                            size: Get.width / 12,
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
      },
    );
  }
}
