import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/class/handlingData_view.dart';
import 'package:e_commerce/view/widget/cart/card_cart.dart';
import 'package:e_commerce/view/widget/cart/cart_quantity_card.dart';
import 'package:e_commerce/view/widget/cart/appbarCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/cart/bottomappCart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  var controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            BottomAppCart(total: controller.priceOrders.toString()),
        body: GetBuilder<CartController>(
          builder: (controller) {
            return HandleDataView(
              statusRequest: controller.statusRequest!,
              widget: ListView(
                children: [
                  CartAppBar(title: "My Cart"),
                  SizedBox(
                    height: Get.width / 19,
                  ),
                  CartQuantity(count: controller.totalCountItems.toString()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          controller.data.length,
                          (index) => CustomCartCard(
                            name: "${controller.data[index].itemsName}",
                            price: "${controller.data[index].itemsPrice}",
                            quantity: "${controller.data[index].itemscount}",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
