import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/itemsDetails_controller.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, this.items});
  final ItemsModel? items;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(DetailsItemsControllerImp());

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: size.height / 3.2,
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: Get.width / 4,
                    left: Get.width / 4,
                    child: Hero(
                      tag: controller.items.itemsId.toString(),
                      child: CachedNetworkImage(
                          width: Get.width / 1,
                          height: Get.height / 4,
                          fit: BoxFit.scaleDown,
                          imageUrl:
                              "${ImageLink.items}/${controller.items.itemsImage}"),
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(top: Get.height / 15, left: Get.width / 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            controller.items.itemsName.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: AppColor.black),
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: Get.width / 3,
                            height: Get.height / 14,
                            child: Text(
                              "${controller.items.itemsPrice}\$",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: AppColor.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Text(
                      controller.items.itemsDescription.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.black),
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<DetailsItemsControllerImp>(
                            builder: (controller) {
                          return Text(
                            "Quantity: ${controller.items.itemsCount}",
                            style: TextStyle(fontSize: Get.width / 16),
                          );
                        }),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
