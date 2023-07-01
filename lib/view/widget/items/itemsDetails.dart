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
                    child: CachedNetworkImage(
                        width: size.width / 1,
                        height: size.height / 4,
                        fit: BoxFit.scaleDown,
                        imageUrl:
                            "${ImageLink.items}/${controller.items.itemsImage}"),
                  ),
                  Text(
                    controller.items.itemsName!,
                    style: TextStyle(color: AppColor.white),
                  ),
                ],
              ),
              // Text(
              //   "Item Description :\n",
              //   style: TextStyle(fontSize: size.width / 18),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 40),
              //   child: Text(""),
              // ),
              // Text("", style: TextStyle(fontSize: size.width / 18)),
            ],
          ),
        ),
      ),
    );
  }
}
