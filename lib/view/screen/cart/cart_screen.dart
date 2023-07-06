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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total : ", style: TextStyle(fontSize: Get.width / 14)),
              Text("600 \$", style: TextStyle(fontSize: Get.width / 14)),
            ],
          ),
          const CutomOrderButton(),
        ],
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Cart",
              style: TextStyle(fontSize: Get.width / 10),
            ),
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
