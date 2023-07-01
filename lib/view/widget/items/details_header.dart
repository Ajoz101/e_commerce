import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/itemsDetails_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class ItemsHeader extends StatelessWidget {
  const ItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailsItemsControllerImp());

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height / 3.2,
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
            child: Container(
              child: CachedNetworkImage(
                  width: Get.width / 1,
                  height: Get.height / 4,
                  fit: BoxFit.scaleDown,
                  imageUrl:
                      "${ImageLink.items}/${controller.items.itemsImage}"),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 15,
          child: Text(
            controller.items.itemsDiscount == "0"
                ? ""
                : "Discount ${controller.items.itemsDiscount}%",
            style: TextStyle(color: AppColor.white, fontSize: Get.width / 16),
          ),
        )
      ],
    );
  }
}
