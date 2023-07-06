import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/view/widget/cart/card_cart.dart';
import 'package:e_commerce/view/widget/cart/cart_quantity_card.dart';
import 'package:e_commerce/view/widget/cart/appbarCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/cart/bottomappCart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  // final ItemsModel? itemsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAppCart(),
      body: ListView(
        children: [
          CartAppBar(title: "My Cart", onPressed: () {}),
          SizedBox(
            height: Get.width / 19,
          ),
          CartQuantity(count: "3"),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomCartCard(
                  name: "Mac",
                  price: "300",
                  quantity: "1",
                ),
                CustomCartCard(
                  name: "Airpods",
                  price: "90",
                  quantity: "2",
                ),
                CustomCartCard(
                  name: "Xaomi Redmi Note 10",
                  price: "200",
                  quantity: "1",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
