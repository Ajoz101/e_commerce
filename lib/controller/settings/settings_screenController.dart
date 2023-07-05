import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/nameOfRoutes.dart';
import '../../core/services/services.dart';

class SettingsController extends GetxController {
  signOut() {
    sharedPref.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  exitAlert() {
    return Get.defaultDialog(
        title: "Sign Out",
        content: Column(
          children: [Text("Are You Sure You Want to Sign out??")],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              signOut();
            },
            child: Text("I'm Sure"),
          ),
          MaterialButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          )
        ]);
  }
}
