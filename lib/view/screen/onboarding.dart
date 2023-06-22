import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/data/static/static.dart';
import 'package:flutter/material.dart';


class OBoarding extends StatelessWidget {
  const OBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) => Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(onBoardingList[i].title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width / 15)),
              CachedNetworkImage(
                  imageUrl: onBoardingList[i].imgUrl!, width: width / 1),
              const SizedBox(
                height: 20,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  onBoardingList[i].body!,
                  style: TextStyle(fontSize: width / 20, color: AppColor.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
