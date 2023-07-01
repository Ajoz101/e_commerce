import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/itemsDetails_controller.dart';
import '../../../core/constant/colors.dart';
import 'itemTitle_and_price.dart';

class ItemDescriptionAndQuantity extends StatelessWidget {
  const ItemDescriptionAndQuantity({super.key});

  @override
  Widget build(BuildContext context) {
        var controller = Get.put(DetailsItemsControllerImp());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ItemTitleAndPrice(),
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
            GetBuilder<DetailsItemsControllerImp>(builder: (controller) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.primary,
                ),
                width: Get.width / 2.4,
                height: Get.height / 15,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Quantity: ${controller.count}",
                    style: TextStyle(
                        fontSize: Get.width / 16, color: AppColor.white),
                  ),
                ),
              );
            }),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.returnBack();
                  },
                  icon: const FaIcon(FontAwesomeIcons.minus),
                ),
                IconButton(
                  onPressed: () {
                    controller.buy();
                  },
                  icon: const FaIcon(FontAwesomeIcons.plus),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: Get.height / 25,
        ),
      ],
    );
  }
}
