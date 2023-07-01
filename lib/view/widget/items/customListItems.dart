import 'package:cached_network_image/cached_network_image.dart';
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
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return GridView.builder(
        itemCount: controller.data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6, crossAxisCount: 2),
        itemBuilder: (context, index) {
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
        height: 200,
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "${itemsModel!.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${ImageLink.items}/${itemsModel!.itemsImage.toString()}",
                    width: size.width / 3,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  itemsModel!.itemsName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.width / 17),
                ),
                Text("Quantity : ${itemsModel!.itemsCount.toString()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width / 20)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel!.itemsPrice.toString()}\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.primary,
                            fontSize: size.width / 18,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColor.primary,
                          ))
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
