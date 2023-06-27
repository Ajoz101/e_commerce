import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 15),
      child: Stack(
        children: [
          GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
              decoration: BoxDecoration(
                  color: AppColor.shadedWhite,
                  borderRadius: BorderRadius.circular(20)),
              height: height / 5,
              width: double.infinity,
              child: ListTile(
                // trailing: FaIcon(
                //   FontAwesomeIcons.starHalfStroke,
                //   color: AppColor.primary,
                //   size: width / 12,
                // ),
                title: Text("hey ${controller.username}",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: width / 17)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "GET A DISCOUNT\nNow!",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(160))),
          ),
        ],
      ),
    );
  }
}
