import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/networkImage_links.dart';
import 'package:e_commerce/view/widget/custom/customAppBar.dart';
import 'package:e_commerce/view/widget/custom/customCard.dart';
import 'package:e_commerce/view/widget/home/CustomCategories.dart';
import 'package:e_commerce/view/widget/home/CustomProductsForYou.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/functions/exitAlert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          return exitAlert();
        },
        child: Scaffold(
          body: SafeArea(
              child: ListView(
            children: [
              const CustomAppBar(),

              const SizedBox(
                height: 20,
              ),
              //Categories
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Categories",
                    style: Theme.of(context).textTheme.headline1),
              ),

              const SizedBox(
                height: 20,
              ),
              const CustomCategories(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Products For You",
                    style: Theme.of(context).textTheme.headline1),
              ),
              CustomProds4You(),

              CustomCard(),
            ],
          )),
        ),
      ),
    );
  }
}
