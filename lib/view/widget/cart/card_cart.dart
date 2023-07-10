import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/image_asset.dart';

class CustomCartCard extends StatelessWidget {
  CustomCartCard({
    super.key,
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.onAdd,
    this.onRemove,
    this.totalOfUnit,
    this.readMore,
  });

  String? name;
  String? price;
  String? quantity;
  String? image;
  String? totalOfUnit;

  void Function()? onAdd;
  void Function()? onRemove;
  void Function()? readMore;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Card(
        elevation: 10,
        child: Container(
          // duration: const Duration(milliseconds: 800),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        CachedNetworkImage(imageUrl: ImageAsset.loading),
                    imageUrl: "${ImageLink.items}/${image}",
                    fit: BoxFit.fitHeight,
                    height: 90),
              ),
              AnimatedContainer(
                clipBehavior: Clip.none,
                color: AppColor.cards,
                duration: const Duration(milliseconds: 800),
                height: controller.heightOfContainer,
                width: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListTile(
                        title: Text(
                          name!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          "\$ $price",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColor.primary, fontFamily: "sans"),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(right: Get.width / 5),
                    //   child: Text("TOTAL OF UNIT : \$${totalOfUnit}",
                    //       textAlign: TextAlign.center),
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            height: 36,
                            child: IconButton(
                              onPressed: onAdd,
                              icon: const Icon(Iconic.plus,
                                  color: AppColor.primary),
                            ),
                          ),
                          Text(
                            quantity!,
                            style: TextStyle(fontFamily: "sans", fontSize: 20),
                          ),
                          SizedBox(
                            height: 35,
                            child: IconButton(
                              onPressed: onRemove,
                              icon: const Icon(
                                Iconic.minus,
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedContainer(
                      color: AppColor.white,
                      duration: Duration(milliseconds: 800),
                      margin: EdgeInsets.only(right: Get.width / 5),
                      child: Opacity(
                        opacity: controller.isReadMore == true ? 1 : 0.0,
                        child: Visibility(
                          visible: controller.isReadMore,
                          child: Text("TOTAL OF UNIT : \$${totalOfUnit}",
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: AppColor.primary,
                      child: IconButton(
                        onPressed: readMore,
                        icon: Icon(
                            controller.isReadMore
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
