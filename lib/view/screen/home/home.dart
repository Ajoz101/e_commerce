import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/functions/exitAlert.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Get.put(HomeControllerImp());
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
              Container(
                margin: EdgeInsets.only(top: height / 24),
                padding: EdgeInsets.symmetric(horizontal: width / 60),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(height / 40),
                            child:
                                const FaIcon(FontAwesomeIcons.magnifyingGlass),
                          ),
                          hintText: "Find product",
                          fillColor: AppColor.secondLight,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        child: FaIcon(FontAwesomeIcons.solidCircleUser,
                            color: AppColor.primary, size: width / 11),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width / 20, vertical: height / 15),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.cards,
                          borderRadius: BorderRadius.circular(20)),
                      height: height / 5,
                      width: double.infinity,
                      child: ListTile(
                        // trailing: FaIcon(
                        //   FontAwesomeIcons.starHalfStroke,
                        //   color: AppColor.primary,
                        //   size: width / 12,
                        // ),
                        title: Text(c.categories[1]['categories_name'],
                            style: Theme.of(context).textTheme.headline1),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "GET A DISCOUNT\nNow!",
                            style: Theme.of(context).textTheme.bodyText1,
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
              ),
              Container(
                decoration: BoxDecoration(
                    // color: AppColor.cards,
                    borderRadius: BorderRadius.circular(20)),
                height: height / 5,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: c.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 29),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.secondLight,
                        ),
                        width: width / 1.7,
                        child: ListTile(
                          title: Text(
                            c.categories[index]["categories_name"],
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: AppColor.primary),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              c.categories[index]["categories_description"],
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
