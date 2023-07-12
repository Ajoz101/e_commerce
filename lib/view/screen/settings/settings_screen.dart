import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/settings/settings_screenController.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.2,
                        image: CachedNetworkImageProvider(
                            "https://img.freepik.com/premium-vector/vector-evening-sky-moon-clouds-flat-style-moon-stars-starry-sky-moon-night-sky_497922-1071.jpg")),
                    color: AppColor.primary,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15))),
                height: Get.width / 2,
              ),
              Positioned(
                top: Get.width / 2.9,
                child: CircleAvatar(
                  backgroundColor: AppColor.second,
                  maxRadius: 60,
                  child: FaIcon(FontAwesomeIcons.userAstronaut,
                      size: Get.width / 5, color: AppColor.primary),
                ),
              ),
              // Positioned(
              //   top: -1,
              //   left: -5,
              //   child: IconButton(
              //       tooltip: "Sign out",
              //       iconSize: Get.width / 7,
              //       onPressed: () {

              //       },
              //       icon: const FaIcon(
              //         FontAwesomeIcons.arrowRightFromBracket,
              //         color: AppColor.white,
              //       )),
              // )
            ],
          ),
          SizedBox(
            height: Get.width / 3,
          ),
          InkWell(
            onTap: () {
              controller.gotoAdress();
            },
            child: Card(
              color: AppColor.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  ListTile(
                    trailing: Icon(Icons.location_on_outlined,
                        color: AppColor.primary),
                    title: Text("Address"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: AppColor.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                ListTile(
                  trailing:
                      Icon(FontAwesomeIcons.question, color: AppColor.primary),
                  title: Text("About us"),
                ),
              ],
            ),
          ),
          Card(
            color: AppColor.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  trailing: Icon(FontAwesomeIcons.telegram,
                      color: AppColor.primaryLight),
                  title: Text("Contact us"),
                ),
              ],
            ),
          ),
          Card(
            color: AppColor.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  hoverColor: AppColor.primary,
                  onTap: () {
                    controller.exitAlert();
                  },
                  trailing: Icon(FontAwesomeIcons.arrowRightFromBracket,
                      color: AppColor.primary),
                  title: Text("Sign out"),
                ),

                // ListTile(
                //   hoverColor: AppColor.primary,
                //   onTap: () {
                //     controller.exitAlert();
                //   },
                //   trailing: Icon(FontAwesomeIcons.arrowRightFromBracket,
                //       color: AppColor.primary),
                //   title: Text("Username :"),
                //   subtitle: Text("${sharedPref.getString("username")}"),
                // ),
                // ListTile(
                //   hoverColor: AppColor.primary,
                //   onTap: () {
                //     controller.exitAlert();
                //   },
                //   trailing: Icon(FontAwesomeIcons.arrowRightFromBracket,
                //       color: AppColor.primary),
                //   title: Text("Phone :"),
                //   subtitle: Text("${sharedPref.getString("phone")}"),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
