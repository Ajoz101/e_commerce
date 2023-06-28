import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class CustomProds4You extends GetView<HomeControllerImp> {
  const CustomProds4You({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: width / 20, vertical: height / 3.4),
        decoration: BoxDecoration(
            // color: AppColor.cards,
            borderRadius: BorderRadius.circular(20)),
        height: height / 2,
        width: width / 4,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(width: width / 11),
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return ItemsWidget(
              items: ItemsModel.fromJson(controller.items[index]),
            );
          },
        ),
      ),
    );
  }
}

class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key, required this.items});

  final ItemsModel items;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(Details(
              items: items,
            ));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 899),
            decoration: BoxDecoration(
              color: AppColor.white,

              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "${ImageLink.items}${items.itemsImage}"),
              ),

              borderRadius: BorderRadius.circular(40),
              // color:  AppColor.secondLight,
            ),
            width: 190,
            height: 150,
            child: SizedBox(),
          ),
        ),
        Text(
          "${items.itemsName}\n ${items.itemsPrice}\$",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: AppColor.black, fontSize: width / 18),
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  Details({super.key, required this.items});
  final ItemsModel items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            items.itemsName.toString(),
          ),
          Text(items.categoriesName.toString())
        ],
      )),
    );
  }
}
