import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  elevation: 14,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(imageUrl: ImageAsset.logo),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text(
                              "Dell  latitude",
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
                          child: Column(children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                            Text(
                              "2",
                              style:
                                  TextStyle(fontFamily: "sans", fontSize: 25),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.minimize),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 14,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CachedNetworkImage(
                              imageUrl: ImageAsset.onBoardingImageOne),
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
                                  icon: Icon(FontAwesomeIcons.plus,
                                      color: AppColor.primary),
                                ),
                              ),
                              Text(
                                "2",
                                style:
                                    TextStyle(fontFamily: "sans", fontSize: 20),
                              ),
                              Container(
                                height: 30,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
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
