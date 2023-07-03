import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favorites/favorites_controller.dart';
import 'package:e_commerce/data/model/favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FavoriteController());
    // controller.display();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Bookmark"),
      ),
      body: GetBuilder<FavoriteController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.data.isNotEmpty ? controller.data.length : 0,
          itemBuilder: (context, index) {
            return controller.data.isNotEmpty
                ? CustomCard(
                    favoritesModel:
                        FavoritesModel.fromJson(controller.data[index]),
                  )
                : const Center(
                    child: Text("You have no favorites 🙁",
                        style: TextStyle(fontSize: 50, color: AppColor.black)),
                  );
          },
        );
      }),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.favoritesModel});
  final FavoritesModel? favoritesModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(FavoriteController());
    return GetBuilder<FavoriteController>(builder: (controller) {
      return InkWell(
        onTap: () {
          // controller.display();
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 200,
          child: Card(
            color: AppColor.black.withOpacity(0.8),
            elevation: 40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: "${favoritesModel!.itemsId}",
                    child: Container(
                      width: Get.width / 5,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ImageLink.items}/${favoritesModel!.itemsImage.toString()}",
                        // width: size.width / 4,
                        fit: BoxFit.contain,
                        height: Get.height / 11,
                      ),
                    ),
                  ),
                  Text(
                    favoritesModel!.itemsName.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 20,
                        color: AppColor.white),
                  ),
                  Text(
                    "${favoritesModel!.itemsPrice.toString()}\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.second,
                        fontSize: size.width / 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity : ${favoritesModel!.itemsCount.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: size.width / 20,
                              color: AppColor.secondLight),
                        ),
                        GetBuilder<FavoriteController>(builder: (controller) {
                          return IconButton(
                              onPressed: () {
                                controller.setFavorite(
                                    favoritesModel!.itemsId, "0");
                                controller.removeFave(
                                    favoritesModel!.itemsId.toString(),
                                    favoritesModel!.itemsName.toString());

                                print(favoritesModel!.itemsId);
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: AppColor.second,
                              ));
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
