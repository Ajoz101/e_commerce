import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: CachedNetworkImage(
          width: width / 1, height: height / 5, imageUrl: ImageAsset.logo),
    );
  }
}
