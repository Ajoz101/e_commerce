import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

exitAlert() {
  return Get.defaultDialog(
      title: "Exit",
      content: Column(
        children: [Text("Are You Sure You Want to Exit?")],
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Exit"),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel"),
        )
      ]);
}
