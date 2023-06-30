import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/items/listcategories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class ItemsPage extends GetView<ItemsControllerImp> {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cards,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomAppBar(
                title: "Search Product",
                onTapSearch: () {},
                color: AppColor.black.withOpacity(0.8),
                height: 1,
                width: 20,
              ),
            ),
            const CustomCategoriesItems(),
            GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 200,
                    child: Card(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "${ImageLink.items}/jbl_headphone.png",
                              width: size.width / 3,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              "Product",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width / 17),
                            ),
                            Text("Description of product",
                                textAlign: TextAlign.center),
                            const Text("Price", textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
