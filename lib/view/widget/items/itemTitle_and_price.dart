import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/itemsDetails_controller.dart';
import '../../../core/constant/colors.dart';

class ItemTitleAndPrice extends StatelessWidget {
  const ItemTitleAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
        var controller = Get.put(DetailsItemsControllerImp());

    return Row(
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
    );
  }
}
