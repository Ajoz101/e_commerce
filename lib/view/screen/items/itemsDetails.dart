import 'package:e_commerce/controller/home/itemsDetails_controller.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/view/widget/items/addToCartButton.dart';
import 'package:e_commerce/view/widget/items/details_header.dart';
import 'package:e_commerce/view/widget/items/itemDescAndQuan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/colors.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key, this.items});
  final ItemsModel? items;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetailsItemsControllerImp());

    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: AddToCart(onPressed: () {
        controller.gotoCart();
      }),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.white,
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //THE STACK IS HERE
              const ItemsHeader(),
              Container(
                margin:
                    EdgeInsets.only(top: Get.height / 15, left: Get.width / 14),
                child:
                    /*
                 * IMPORTANT: The title and price are inside the ItemDescriptionAndQuantity()
                 */
                    GetBuilder<DetailsItemsControllerImp>(
                        builder: (controller) {
                  return ItemDescriptionAndQuantity(
                    description: controller.items.itemsDescription.toString(),
                    onRemove: () {
                      controller.remove();
                    },
                    onAdd: () {
                      controller.buy();
                    },
                    quantity: controller.count.toString(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
