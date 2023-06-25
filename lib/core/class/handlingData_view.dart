import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/colors.dart';

class HandleDataView extends StatelessWidget {
  HandleDataView(
      {super.key, required this.statusRequest, required this.widget});
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(ImageAsset.loading),
          )
        : statusRequest == StatusRequest.serverFailure
            ? const Center(child: Text("Server Fail"))
            : statusRequest == StatusRequest.offlineFailure
                ? Center(
                    child: Text("offline",
                        style: Theme.of(context).textTheme.headline1),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Text("Theres no Data 😅",
                            style: Theme.of(context).textTheme.headline1),
                      )
                    : widget;
  }
}
