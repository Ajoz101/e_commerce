import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorites/favorites_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';
import '../../../data/model/items.dart';

class SearchedItems extends StatelessWidget {
  const SearchedItems(
      {super.key, required this.listdata, required this.controller});
  final List<ItemsModel> listdata;
  final controller;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.searchedData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.gotoDetails(listdata[index]);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            height: Get.width / 2,
            child: Card(
              color: AppColor.primary.withOpacity(0.8),
              elevation: 40,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: "${listdata[index].itemsId}",
                      child: Container(
                        width: Get.width / 4,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ImageLink.items}/${listdata[index].itemsImage.toString()}",
                          // width: size.width / 4,
                          fit: BoxFit.contain,
                          height: Get.height / 5,
                          width: Get.height / 19,
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                        ]),
                    Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 100),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<FavoriteController>(
                              init: FavoriteController(),
                              builder: (controller) {
                                return IconButton(
                                  splashColor: AppColor.second,
                                  onPressed: () {
                                    if (controller.isFavorite[
                                            listdata[index].itemsId] ==
                                        "0") {
                                      controller.setFavorite(
                                          listdata[index].itemsId, "1");
                                      controller.addFave(
                                          listdata[index].itemsId.toString());
                                    } else {
                                      controller.setFavorite(
                                          listdata[index].itemsId, "0");
                                      controller.removeFave(
                                          listdata[index].itemsId.toString(),
                                          listdata[index].itemsName.toString());
                                    }
                                    print(listdata[index].itemsId);
                                  },
                                  icon: Icon(
                                    controller.isFavorite[
                                                listdata[index].itemsId] ==
                                            "1"
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
