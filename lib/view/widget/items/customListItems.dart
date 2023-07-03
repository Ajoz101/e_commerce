import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorites/favorites_controller.dart';
import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(ItemsControllerImp());
    var faveController = Get.put(FavoriteController());
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return GridView.builder(
        itemCount: controller.data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7, crossAxisCount: 2),
        itemBuilder: (context, index) {
          faveController.isFavorite[controller.data[index]["items_id"]] =
              controller.data[index]["favorite"];
          return CustomCard(
            itemsModel: ItemsModel.fromJson(controller.data[index]),
          );
        },
      );
    });
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.itemsModel});
  final ItemsModel? itemsModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () {
        controller.gotoDetails(itemsModel!);
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
                  tag: "${itemsModel!.itemsId}",
                  child: Container(
                    width: Get.width / 5,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ImageLink.items}/${itemsModel!.itemsImage.toString()}",
                      // width: size.width / 4,
                      fit: BoxFit.contain,
                      height: Get.height / 11,
                    ),
                  ),
                ),
                Text(
                  itemsModel!.itemsName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width / 20,
                      color: AppColor.second),
                ),
                Text(
                  "${itemsModel!.itemsPrice.toString()}\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: size.width / 18,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height / 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<FavoriteController>(builder: (controller) {
                        return IconButton(
                          splashColor: AppColor.second,
                          onPressed: () {
                            if (controller.isFavorite[itemsModel!.itemsId] ==
                                "0") {
                              controller.setFavorite(itemsModel!.itemsId, "1");
                              controller
                                  .addFave(itemsModel!.itemsId.toString());
                            } else {
                              controller.setFavorite(itemsModel!.itemsId, "0");
                              controller.removeFave(
                                  itemsModel!.itemsId.toString(),
                                  itemsModel!.itemsName.toString());
                            }
                            print(itemsModel!.itemsId);
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel!.itemsId] == "1"
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
  }
}
