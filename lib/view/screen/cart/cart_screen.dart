import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:e_commerce/view/widget/customappButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widget/cart/orderbutton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width / 15),
                  child: Text("Total : ",
                      style: TextStyle(fontSize: Get.width / 16))),
              Container(
                width: Get.width / 3,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: Get.width / 15),
                child: Text(
                  textAlign: TextAlign.center,
                  "600 \$",
                  style: TextStyle(
                      fontSize: Get.width / 16,
                      color: AppColor.white,
                      fontFamily: "sans"),
                ),
              ),
            ],
          ),
          const CutomOrderButton(),
        ],
      ),
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "My Cart",
                  style: TextStyle(fontSize: Get.width / 10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.width / 19,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: Get.width / 10,
            padding: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20)),
            child: Text("You have 2 Items in the cart",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.white)),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  elevation: 10,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                              imageUrl: ImageAsset.logo,
                              fit: BoxFit.fitHeight,
                              height: 90),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Mac  M2 max",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "\$300",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.primary),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 36,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconic.plus,
                                      color: AppColor.forGradient),
                                ),
                              ),
                              Text(
                                "2",
                                style:
                                    TextStyle(fontFamily: "sans", fontSize: 20),
                              ),
                              SizedBox(
                                height: 35,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Iconic.minus,
                                      color: AppColor.forGradient,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                              imageUrl: ImageAsset.onBoardingImageThree,
                              fit: BoxFit.fitHeight,
                              height: 90),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Mac  M2 max",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "\$300",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.primary),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                height: 36,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Iconic.plus,
                                      color: AppColor.forGradient),
                                ),
                              ),
                              Text(
                                "2",
                                style:
                                    TextStyle(fontFamily: "sans", fontSize: 20),
                              ),
                              SizedBox(
                                height: 35,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Iconic.minus,
                                      color: AppColor.forGradient,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
